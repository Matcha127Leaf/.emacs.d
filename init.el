;;;;;;; package.el (Package Manager)
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)

;;; Add package directory to load path
(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))

(package-initialize) 


;;;; Packages to install 
(defvar my/packages
  '(
    ac-c-headers
    ac-helm
    ac-octave
    async
    auto-complete
    auto-complete-c-headers
    auto-complete-chunk
    auto-complete-clang
    c-eldoc
    dash
    dash-functional
    epl
    f
    flycheck
    function-args
    ggtags
    git-gutter
    groovy-mode
    helm
    helm-core
    helm-flycheck
    helm-flymake
    helm-gtags
    htmlize
    let-alist
    ob-ipython
    org
    p4
    pkg-info
    popup
    s
    sr-speedbar
    swiper
    undo-tree 
    undohist
    yasnippet
    )
  "A list of packages to be installed at launch.")

;;;; Install packages
(dolist (package my/packages)
    (when (or (not (package-installed-p package)))
      (package-install package)))

;;;; ;;;; el-get (package manager)
;;;; (when load-file-name
;;;;   (setq user-emacs-directory (file-name-directory load-file-name)))
;;;; 
;;;; (add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
;;;; (unless (require 'el-get nil 'noerror)
;;;;   (with-current-buffer
;;;;       (url-retrieve-synchronously
;;;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;;;     (goto-char (point-max))
;;;;     (eval-print-last-sexp)))
;;;; 
;;;; (el-get-bundle elpa:ac-c-headers)
;;;; (el-get-bundle elpa:ac-helm)      
;;;; (el-get-bundle elpa:ac-octave)          
;;;; (el-get-bundle elpa:async)         
;;;; (el-get-bundle elpa:auto-complete)
;;;; (el-get-bundle elpa:auto-complete-c-headers)
;;;; (el-get-bundle elpa:auto-complete-chunk)
;;;; (el-get-bundle elpa:auto-complete-clang)
;;;; (el-get-bundle elpa:c-eldoc)
;;;; (el-get-bundle elpa:dash)           
;;;; (el-get-bundle elpa:dash-functional)
;;;; (el-get-bundle elpa:epl)   
;;;; (el-get-bundle elpa:f)               
;;;; (el-get-bundle elpa:flycheck)
;;;; (el-get-bundle elpa:function-args)
;;;; (el-get-bundle elpa:ggtags)     
;;;; (el-get-bundle elpa:git-gutter)
;;;; (el-get-bundle elpa:groovy-mode)
;;;; (el-get-bundle elpa:helm)
;;;; (el-get-bundle elpa:helm-core)          
;;;; (el-get-bundle elpa:helm-flycheck)      
;;;; (el-get-bundle elpa:helm-flymake)       
;;;; (el-get-bundle elpa:helm-gtags)         
;;;; (el-get-bundle elpa:htmlize)        
;;;; (el-get-bundle elpa:let-alist)          
;;;; (el-get-bundle elpa:ob-ipython)         
;;;; (el-get-bundle elpa:org)        
;;;; (el-get-bundle elpa:p4)               
;;;; (el-get-bundle elpa:pkg-info)
;;;; (el-get-bundle elpa:popup)          
;;;; (el-get-bundle elpa:s)             
;;;; (el-get-bundle elpa:sr-speedbar)
;;;; (el-get-bundle elpa:swiper)       
;;;; (el-get-bundle elpa:undo-tree)         
;;;; (el-get-bundle elpa:undohist)         
;;;; (el-get-bundle elpa:yasnippet)

;;; Load path
(setq load-path (append
                 '("~/lib")
                 load-path))

;;; My key config
(global-unset-key "\C-h")
(global-set-key "\C-h" 'delete-backward-char)
(global-unset-key "\C-t")
(global-set-key "\C-t" 'scroll-down)
(global-unset-key "\C-q")
(global-set-key "\C-q\C-q" 'beginning-of-buffer)
(global-set-key "\C-q\C-a" 'query-replace)
(global-set-key "\C-q\C-s" 'search-forward)
(global-set-key "\C-q\C-r" 'search-backward)
(global-set-key "\C-q\C-g" 'goto-line)
(global-set-key "\C-q\C-j" 'goto-line)
(global-set-key "\C-qj" 'goto-line)

;;; colum/line number is on
(column-number-mode t)
(line-number-mode   t)

;; turn off active region highlighting
(transient-mark-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil))

;; 
;; Backup and autosave file location (one place)
;;
(defconst emacs-tmp-dir (expand-file-name "~/backup"))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)
;;;;
;;;; Backup file location (one place)
;;(setq backup-by-copying nil)
;;(setq make-backup-files nil)
;;(setq backup-directory-alist
;;      (cons (cons "\.*$" (expand-file-name "~/backup"))
;;	    backup-directory-alist))
;;(setq version-control t)
;;(setq delete-old-versions t)


;;;;;; No backup file
;;(setq make-backup-files nil) 
;;(setq backup-inhibited t)


;;
;; org mode configurations
;;
(setq org-indent-mode t)
(setq org-confirm-babel-evaluate nil)
(setq org-startup-with-inline-images t)
(setq org-src-fontify-natively t) ;; highlight code-block

;; jupyter-noteblook
(require 'ob-ipython)
;; odt write
(require 'ox-odt)

(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
	(ipython . t)
        (sh . t)
	(calc . t)
	(ditaa . t)
	(perl . t)
	(python . t)))

;; ditaa 
(setq org-ditaa-jar-path
      "~/.emacs.d/elpa/contrib/scripts/ditaa.jar")

;; picture mode
(add-hook 'picture-mode-hook 'picture-mode-init)
(autoload 'picture-mode-init "picture-init")

;; MS office document
(add-to-list 'org-file-apps '("\\.xls\\'" . default))
(add-to-list 'org-file-apps '("\\.xlsx\\'" . default))
(add-to-list 'org-file-apps '("\\.doc\\'" . default))
(add-to-list 'org-file-apps '("\\.docx\\'" . default))
(add-to-list 'org-file-apps '("\\.ppt\\'" . default))
(add-to-list 'org-file-apps '("\\.pptx\\'" . default))

;; Beamer
(eval-after-load "ox-latex"

  ;; update the list of LaTeX classes and associated header (encoding, etc.)
  ;; and structure
  '(add-to-list 'org-latex-classes
                `("beamer"
                  ,(concat "\\documentclass[presentation]{beamer}\n"
                           "[DEFAULT-PACKAGES]"
                           "[PACKAGES]"
                           "[EXTRA]\n")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
(setq org-latex-listings t)

;; orb-babel library
(org-babel-lob-ingest "~/.emacs.d/lib/my_ob_python_lib.org")

;; org mode configurations end
;;

;;; Hide Mouse Cursor
(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)

;; system-type predicates
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (eq window-system 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      ntemacs-p (and nt-p (not meadow-p))
      windows-p (or cygwin-p nt-p meadow-p))

;; Windows meadow
(when meadow-p
  (progn
    (load "~/.emacs.d/env/meadow.el")
  ))
;; Windows - ntemacs
(when ntemacs-p
  (progn
    (load "~/.emacs.d/env/ntemacs.el")
  ))

;; Mac OS X
(when darwin-p
  (progn
    (load "~/.emacs.d/env/mac.el")
  ))



;; Automatically reload files after they've been modified 
;; (typically in Visual C++)
(global-auto-revert-mode 1)

;;
;; C++ indent change
;;
;;(add-hook 'c-mode-common-hook
;;	  '(lambda ()
;;	     (c-set-style "bsd")
;;	     ))
;;
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 2)                  ;; Default is 2
 (setq c-indent-level 2)                  ;; Default is 2

 (setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60))
 (setq tab-width 2)
 (setq indent-tabs-mode nil)  ; use spaces only if nil
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;
;; Groovy-mode
;;
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("Jenkinsfile" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;;;;
;;;;; Gtag
;;;;;
;; 	
;;(autoload 'gtags-mode "gtags" "" t)
;;(setq gtags-mode-hook
;;      '(lambda ()
;;         (local-set-key "\M-t" 'gtags-find-tag)
;;         (local-set-key "\M-r" 'gtags-find-rtag)
;;         (local-set-key "\M-s" 'gtags-find-symbol)
;;         ))
;;
;;(add-hook 'c-mode-common-hook
;;          '(lambda()
;;             (gtags-mode 1)
;;             (gtags-make-complete-list)
;;             ))
;;
;;
;;;; Load verilog mode only when needed
;;(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
;;;; Any files that end in .v should be in verilog mode
;;(setq auto-mode-alist (cons  '("\\.v\\'" . verilog-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons  '("\\.sv\\'" . verilog-mode) auto-mode-alist))
;;;; Any files in verilog mode should have their keywords colorized
;;(add-hook 'verilog-mode-hook
;;          '(lambda ()
;;             (font-lock-mode 1)
;;             (setq indent-tabs-mode nil)
;;             (setq verilog-auto-newline nil)
;;             (setq verilog-indent-level 3)
;;             (setq verilog-indent-level-module 3)
;;             (setq verilog-indent-level-declaration 3)
;;             (setq verilog-indent-level-behavioral  3)
;;             (setq verilog-tab-always-indent t)
;;             (setq font-lock-face-attributes
;;                   '((font-lock-comment-face "Firebrick")
;;                     (font-lock-string-face "RosyBrown")
;;                     (font-lock-keyword-face "Purple")
;;                     (font-lock-function-name-face "Blue")
;;                     (font-lock-variable-name-face "DarkGoldenrod")
;;                     (font-lock-type-face "DarkOliveGreen")
;;                     (font-lock-reference-face "CadetBlue")))
;;             ))
;;
;;
;;(load-library "p4")

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;; emacsclient 
(require 'server)
(unless (server-running-p)
  (server-start))

;; server start for emacs-client
;(when window-system                       ; when GUI
;  (require 'server)
;  (unless (eq (server-running-p) 't)
;    (server-start)
;
;    (defun iconify-emacs-when-server-is-done ()
;      (unless server-clients (iconify-frame)))
;
;    ;; Assign another key to C-x C-c
;    (global-set-key (kbd "C-x C-c") 'server-edit)
;    ;; Add option to exit emacs with M-x exit
;    (defalias 'exit 'save-buffers-kill-emacs)
;    ;; Minimize at hook up
;    (add-hook 'after-init-hook 'iconify-emacs-when-server-is-done)
;
;    ;; Ask yes-or-no when kill
;    (setq confirm-kill-emacs 'yes-or-no-p)
;    )
;  )
;;;
;;; end of file
;;;


 
