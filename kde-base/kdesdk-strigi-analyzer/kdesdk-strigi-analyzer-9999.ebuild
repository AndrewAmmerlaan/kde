# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KMNAME="kdesdk-strigi-analyzers"
inherit kde4-base

DESCRIPTION="kdesdk: strigi plugins"
KEYWORDS=""
IUSE="debug"

DEPEND="
	app-misc/strigi
"
RDEPEND="${DEPEND}"
