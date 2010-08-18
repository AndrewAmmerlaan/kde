# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

ESVN_REPO_URI="svn://anonsvn.kde.org/home/kde/trunk/kdesupport/${PN}"
ESVN_PROJECT="${PN}"
inherit base cmake-utils eutils subversion

DESCRIPTION="Fast crawling desktop search engine with Qt4 GUI"
HOMEPAGE="http://strigi.sourceforge.net/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="clucene +dbus debug exif fam ffmpeg hyperestraier inotify log +qt4 test xine"

COMMONDEPEND="
	app-arch/bzip2:0
	dev-libs/libxml2:2
	sys-libs/zlib:0
	virtual/libiconv
	clucene? ( >=dev-cpp/clucene-0.9.21[-debug] )
	dbus? (
		sys-apps/dbus
		qt4? ( x11-libs/qt-dbus:4 )
	)
	exif? ( >=media-gfx/exiv2-0.17 )
	fam? ( virtual/fam )
	ffmpeg? ( media-video/ffmpeg )
	hyperestraier? ( app-text/hyperestraier )
	log? ( >=dev-libs/log4cxx-0.10.0 )
	qt4? (
		x11-libs/qt-core:4
		x11-libs/qt-gui:4
	)
	xine? ( media-libs/xine-lib )
"
DEPEND="${COMMONDEPEND}
	test? ( dev-util/cppunit )"
RDEPEND="${COMMONDEPEND}"

src_prepare() {
	# subverison has own src_prepare
	# so this is not required on stable ebuild
	base_src_prepare
}

src_configure() {
	# Enabled: POLLING (only reliable way to check for files changed.)

	mycmakeargs=(
		-DENABLE_POLLING=ON
		-DFORCE_DEPS=ON
		-DENABLE_CPPUNIT=OFF
		-DENABLE_REGENERATEXSD=OFF
		$(cmake-utils_use_enable clucene)
		$(cmake-utils_use_enable dbus)
		$(cmake-utils_use_enable exif EXIV2)
		$(cmake-utils_use_enable fam)
		$(cmake-utils_use_enable ffmpeg)
		$(cmake-utils_use_enable hyperestraier)
		$(cmake-utils_use_enable inotify)
		$(cmake-utils_use_enable log LOG4CXX)
		$(cmake-utils_use_enable qt4)
		$(cmake-utils_use_enable test CPPUNIT)
		$(cmake-utils_use_enable xine)
	)

	if use qt4; then
		mycmakeargs+=(-DENABLE_DBUS=ON)
	fi

	cmake-utils_src_configure
}

pkg_postinst() {
	if ! use clucene && ! use hyperestraier; then
		echo
		elog "Because you didn't enable either of the available backends:"
		elog "clucene or hyperestraier, strigi may not be functional."
		elog "If you intend to use standalone strigi indexer (not needed for KDE),"
		elog "be sure to reinstall app-misc/strigi with either clucene (recommended)"
		elog "or hyperestraier (unreliable) USE flag enabled."
		echo
	fi
}
