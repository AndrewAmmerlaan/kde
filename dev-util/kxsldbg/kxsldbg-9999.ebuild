# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

KMNAME="extragear/sdk"
inherit kde4-meta

DESCRIPTION="A KDE KPart Application for xsldbg, an XSLT debugger"
HOMEPAGE="http://www.kde.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS=""
SLOT="4"
IUSE="debug +handbook"

DEPEND="
	dev-libs/libxslt
	dev-libs/libxml2
"
RDEPEND="${DEPEND}"

src_unpack() {
	if use handbook; then
		KMEXTRA="doc/xsldbg"
	fi

	kde4-meta_src_unpack
}

src_configure() {
	mycmakeargs=(-DWITH_LibXml2=ON -DWITH_Xslt=ON)

	kde4-meta_src_configure
}
