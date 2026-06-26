import type { APIRoute } from 'astro';

export const GET: APIRoute = async ({ locals }) => {
  try {
    // 1. Grab the Cloudflare environment runtime from Astro
    // Replace your old line 6 with this:
    const runtime = (locals as any).runtime;

    
    if (!runtime || !runtime.env) {
      return new Response("Cloudflare runtime environment not found", { status: 500 });
    }

    // 2. Fetch the backup file from your live R2 bucket binding
    const bucket = runtime.env.siakad_backup_bucket;
    const object = await bucket.get('d1-export.sql');

    if (object === null) {
      return new Response("Backup file not found in R2 bucket", { status: 404 });
    }

    // 3. Set headers so your browser downloads it as a file attachment
    const headers = new Headers();
    object.writeHttpMetadata(headers);
    headers.set('etag', object.httpEtag);
    headers.set('Content-Disposition', 'attachment; filename="d1-export.sql"');

    // 4. Return the raw file stream directly to your browser
    return new Response(object.body, {
      headers,
    });
  } catch (error: any) {
    return new Response(`Error: ${error.message}`, { status: 500 });
  }
};
