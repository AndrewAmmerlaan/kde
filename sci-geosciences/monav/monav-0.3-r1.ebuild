# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=4

inherit qt4-r2

DESCRIPTION="State-of-the-art fast and exact routing with OpenStreetMap Data"
HOMEPAGE="http://code.google.com/p/monav/"
SRC_URI="http://monav.googlecode.com/files/monav-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="client +preprocessor preprocessor-gui"

REQUIRED_USE="preprocessor? ( preprocessor-gui )"

DEPEND="x11-libs/qt-core:4
	preprocessor-gui? ( client? ( x11-libs/qt-gui:4 )
		x11-libs/qt-mobility[location] )
	preprocessor? (	dev-libs/libxml2
		app-arch/bzip2
		sci-geosciences/mapnik
		dev-libs/protobuf )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-qmake.patch \
		"${FILESDIR}"/${P}-mapnik2.patch
}

src_configure() {
	eqmake4 "${S}"/monavroutingdaemon.pro CONFIG+=nogui -o "${S}"/Makefile.routingdaemon

	if use preprocessor ; then
		eqmake4 "${S}"/monavpreprocessor.pro CONFIG+=nogui -o "${S}"/Makefile.preprocessor
	fi

	if use preprocessor-gui ; then
		eqmake4 "${S}"/monavpreprocessor-gui.pro -o	"${S}"/Makefile.preprocessor-gui
	fi

	if use client ; then
		eqmake4 "${S}"/monavclient.pro -o "${S}"/Makefile.client
	fi
}

src_compile() {
	emake -f "${S}"/Makefile.routingdaemon

	if use preprocessor ; then
		emake -f "${S}"/Makefile.preprocessor
	fi

	if use preprocessor-gui ; then
		emake -f "${S}"/Makefile.preprocessor-gui
	fi

	if use client ; then
		emake -f "${S}"/Makefile.client
	fi
}

src_install() {
	dobin bin/daemon-test
	dobin bin/monav-daemon

	if use preprocessor ; then
		dobin bin/monav-preprocessor
	fi

	if use preprocessor-gui ; then
		dobin bin/monav-preprocessor-gui
	fi

	if use client ; then
		dobin bin/monav
	fi
}
