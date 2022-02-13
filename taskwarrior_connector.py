#!/usr/bin/env python3

from http.server import BaseHTTPRequestHandler, HTTPServer
from sys import argv
import urllib.parse
import os


class Handler(BaseHTTPRequestHandler):
    def _ok(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def _failed(self):
        self.send_response(500)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        args = urllib.parse.parse_qs(self.path[2:])
        inovke_str="task" \
                  + (("".join([" +" + x for x in args["tag"][0].split()])) if "tag" in args else "") \
                  + " add" \
                  + " \"" + args["title"][0] + "\"" \
                  + " url:\"" + args["url"][0] + "\""
        print(inovke_str)
        os.system(inovke_str)
        self._ok()


def run(server_class=HTTPServer, handler_class=Handler, port=34810):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()


if __name__ == '__main__':

    # handle special location of taskwarrior on macOS
    os.environ['PATH'] += os.pathsep \
                          + "/opt/homebrew/bin"

    if len(argv) == 2:
        run(port=int(argv[1]))
    else:
        run()
