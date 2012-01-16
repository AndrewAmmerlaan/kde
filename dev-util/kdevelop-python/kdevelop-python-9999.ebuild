# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"
KMNAME="kdevelop"
KDE_SCM="git"
EGIT_REPONAME="kdev-python"
inherit kde4-base python

DESCRIPTION="Python plugin for KDevelop 4"
SLOT="4"
KEYWORDS=""
LICENSE="GPL-2"
IUSE="debug"

DEPEND="
	>=dev-util/kdevelop-pg-qt-0.9.0
	dev-util/kdevelop
"
RDEPEND="${DEPEND}"

RESTRICT="test"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_configure() {
	mycmakeargs=( -DCMAKE_INSTALL_PREFIX=/usr/ )
	cmake-utils_src_configure
}

src_compile() {
	pushd ${WORKDIR}/kdevelop-python-9999_build
	emake parser
	popd

}
