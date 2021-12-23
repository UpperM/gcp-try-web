#
# This is an example VCL file for Varnish.
#
# It does not do anything by default, delegating control to the
# builtin VCL. The builtin VCL is called when there is no explicit
# return statement.
#
# See the VCL chapters in the Users Guide for a comprehensive documentation
# at https://www.varnish-cache.org/docs/.

# Marker to tell the VCL compiler that this VCL has been written with the
# 4.0 or 4.1 syntax.
vcl 4.1;

# Default backend definition. Set this to point to your content server.
backend nginx-a {
    .host = "nginx-a";
    .port = "80";
}

backend nginx-b {
    .host = "nginx-b";
    .port = "80";
}

backend nginx-c {
    .host = "nginx-c";
    .port = "80";
}

director load_balance round-robin {
  {
    .backend = nginx-a;
  }
  {
    .backend = nginx-b;
  }
  {
    .backend = nginx-c;
  }
}

sub vcl_recv {
    set req.backend = load_balance;
}

sub vcl_backend_response {
}

sub vcl_deliver {
}
