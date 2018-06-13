EAPI=6

# Requires python3_6 which is not yet stable in Gentoo
# Be sure to add `x11-misc/pywal python_targets_python3_6` to /etc/portage/package.use/pywal
PYTHON_COMPAT=( python{3_5,3_6} )

inherit distutils-r1 git-r3

DESCRIPTION="Generate and change colorschemes on the fly. A 'wal' rewrite in Python 3."
HOMEPAGE="https://github.com/dylanaraps/pywal"
SRC_URI=""
EGIT_REPO_URI="https://github.com/dylanaraps/pywal"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
		media-gfx/imagemagick
"
