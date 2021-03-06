;;; init-packages.el --- initialize packages and repositories

;;; Commentary:
;;;
;;; On startup, initialize packages and repositories. Check for all of the
;;; packages listed and if they don't exist, install them.

;;; Code:

(setq package-list '(tabulated-list afternoon-theme
                                    ac-slime
                                    ace-window
                                    auctex
                                    auto-complete
                                    circe
                                    coffee-mode
                                    dash
                                    emmet-mode
                                    epl
                                    evil
                                    evil-leader
                                    evil-numbers
                                    evil-org
                                    expand-region
                                    flycheck
                                    ghci-completion
                                    goto-chg
                                    haskell-mode
                                    helm
                                    helm-projectile
                                    highlight-parentheses
                                    ido-vertical-mode
                                    js2-mode
                                    json-mode
                                    json-reformat
                                    json-snatcher
                                    jsx-mode
                                    jquery-doc
                                    key-chord
                                    latex-extra
                                    less-css-mode
                                    magit
                                    markdown-mode
                                    moz
                                    mu4e-maildirs-extension
                                    nodejs-repl
                                    org
                                    org-page
                                    php-mode
                                    phpunit
                                    pkg-info
                                    pkgbuild-mode
                                    popup
                                    projectile
                                    recompile-on-save
                                    rust-mode
                                    s
                                    shakespeare-mode
                                    slime
                                    smart-mode-line
                                    smex
                                    smooth-scroll
                                    switch-window
                                    undo-tree
                                    web-mode
                                    yaml-mode
                                    yasnippet
                                    ztree
                                    ))

(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                         ("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(provide 'init-packages)

;;; init-packages.el ends here
