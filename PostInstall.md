Generate Locales
$ locale-gen

Setup secure boot keys
$ sbctl create-keys
$ sbctl enroll-keys -m

Reinstall systemd to trigger hooks
$ bootctl install

Ensure everything signed:
$ sbctl verify
