def _bigfile_impl(repository_ctx):
    ret = repository_ctx.execute(["time", "fallocate", "-l", "10G", "bigfile.img"])
    print("\n" + ret.stderr)
    repository_ctx.file("BUILD", "exports_files([\"bigfile.img\"])")

bigfile = repository_rule(
    implementation = _bigfile_impl,
)
