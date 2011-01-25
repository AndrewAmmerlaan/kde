# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils

DESCRIPTION="Set of libraries for using and integrating transformation algorithms"
HOMEPAGE="http://opengtl.org/"
SRC_URI="${HOMEPAGE}download/OpenGTL-${PV}.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	media-libs/libpng
	media-libs/libopenraw
	=sys-devel/llvm-2.4
"
# =sys-devel/llvm-2.4 is in java-overlay

DEPEND="${RDEPEND}
	>=dev-util/cmake-2.6"

src_install() {
	cmake-utils_src_install
	newdoc OpenShiva/doc/specifications/region.pdf OpenShiva.pdf
}
