# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde4-base

DESCRIPTION="Nonogram logic game for KDE"
SLOT="4"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="$(add_kdebase_dep libkdegames)"
RDEPEND="${DEPEND}"
