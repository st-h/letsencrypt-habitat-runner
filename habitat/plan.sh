pkg_name=cert
pkg_origin=stacktune
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")

do_build() {
  return 0;
}

do_install() {
  cp results/certs.zip "${pkg_prefix}/certs.zip"
}
