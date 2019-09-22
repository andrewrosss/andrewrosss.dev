# stdlib
from pathlib import Path

# 3rd party
# ---------

# local
from andrewrosss_dev import app


@app.route("/", defaults={"filename": "index.html"})
@app.route("/<path:filename>")
def docs_pipe_inputs(filename):
    path = Path("pages") / filename
    return app.send_static_file(path)
