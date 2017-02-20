(require 'package)                      ; built-in

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(package-install 'use-package)              ; Installed by packages.el


(require 'use-package)

(use-package org
  :ensure t
  :config
  ;; syntax highlight
  (use-package htmlize :ensure t)
  (setq org-html-htmlize-output-type 'css)
  ;; org-babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (clojure . t)
     (sh . t)
     (ditaa . t)
     (dot . t)
     (plantuml . t)))
  )

(defun generate-html ()
  (find-file "hi.org")
  (org-html-export-to-html))