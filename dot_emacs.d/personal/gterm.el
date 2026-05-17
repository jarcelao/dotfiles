(unless (package-installed-p 'gterm)
  (package-vc-install
   '(gterm :url "https://github.com/jarcelao/emacs-libgterm.git"
           :branch "feat/linux-support")))
