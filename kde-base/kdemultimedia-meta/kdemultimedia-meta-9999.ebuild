# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit kde4-meta-pkg

DESCRIPTION="kdemultimedia - merge this to pull in all kdemultimedia-derived packages"
KEYWORDS=""
IUSE="ffmpeg"

RDEPEND="
	$(add_kdebase_dep dragonplayer)
	$(add_kdebase_dep juk)
	$(add_kdebase_dep kdemultimedia-kioslaves)
	$(add_kdebase_dep kmix)
	$(add_kdebase_dep kscd)
	$(add_kdebase_dep libkcddb)
	$(add_kdebase_dep libkcompactdisc)
	$(add_kdebase_dep mplayerthumbs)
	ffmpeg? ( $(add_kdebase_dep ffmpegthumbs) )
"
