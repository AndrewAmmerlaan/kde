# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit kde4-base git

DESCRIPTION="A webcam application to attract sweet girls to kde :)"
HOMEPAGE="http://gitorious.org/kamoso"
EGIT_REPO_URI="git://gitorious.org/kamoso/mainline.git"

LICENSE="GPL-3"
KEYWORDS=""
SLOT="0"
IUSE="debug"

DEPEND="
	>=kde-base/libkipi-${KDE_MINIMAL}
	>=media-video/vlc-1.0.0[v4l2]
"
RDEPEND="${DEPEND}"
