# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_HANDBOOK="optional"
KMNAME="audiocd-kio"
KDE_SCM="git"
inherit kde4-base

DESCRIPTION="KDE kioslaves from the kdemultimedia package"
KEYWORDS=""
IUSE="debug encode flac vorbis"

# 4 of 9 tests fail. Last checked for 4.2.88
RESTRICT=test

DEPEND="
	$(add_kdebase_dep libkcddb)
	$(add_kdebase_dep libkcompactdisc)
	media-sound/cdparanoia
	encode? (
		flac? ( >=media-libs/flac-1.1.2 )
		vorbis? ( media-libs/libvorbis )
	)
"
RDEPEND="${DEPEND}"

KMLOADLIBS="libkcddb"

src_configure() {
	if use encode; then
		mycmakeargs=(
			$(cmake-utils_use_with flac)
			$(cmake-utils_use_with vorbis OggVorbis)
		)
	else
		mycmakeargs=(-DWITH_OggVorbis=OFF -DWITH_Flac=OFF)
	fi

	kde4-base_src_configure
}
