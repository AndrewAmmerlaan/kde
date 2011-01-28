# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

KMNAME="playground/base/plasma"
KMMODULE="applets/${PN}"
inherit kde4-meta

DESCRIPTION="A central menubar for all KDE programs"
HOMEPAGE="http://plasma.kde.org/"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="0"
IUSE="debug"

RDEPEND="
	!kde-plasmoids/menubar
	>=kde-base/plasma-workspace-${KDE_MINIMAL}
"
