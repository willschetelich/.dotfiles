import os

QMK = os.path.expanduser("~/qmk_firmware")
REPO = os.path.dirname(os.path.abspath(__file__))

for src, dst in [
    (f"{REPO}/users/will-sval", f"{QMK}/users/will-sval"),
    (f"{REPO}/keyboards/svalboard/keymaps/will-sval", f"{QMK}/keyboards/svalboard/keymaps/will-sval"),
]:
    if os.path.islink(dst):
        os.remove(dst)
    os.symlink(src, dst)
