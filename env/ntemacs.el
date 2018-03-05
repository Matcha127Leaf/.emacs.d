;; exec-path
(setq exec-path (append exec-path '("C:/Users/ymatsuba/Documents/bin")))
(setq exec-path (append exec-path '("C:/GnuWin32/bin")))
;;(setenv "PATH" (concat (getenv "PATH") ";C:\\Users\\ymatsuba\\Documents\\bin"))

;; screen size
(setq my-screen-font-size 14)

;; vstudio 
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil) 

;; vstudio 
;;(require 'rc-vstudio)

;;;; Server Start
(require 'server)
(unless (server-running-p)
  (server-start))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 90 :width normal))))
 '(fa-face-hint ((t (:background "#3f3f3f" :foreground "#ffffff"))))
 '(fa-face-hint-bold ((t (:background "#3f3f3f" :weight bold))))
 '(fa-face-semi ((t (:background "#3f3f3f" :foreground "#ffffff" :weight bold))))
 '(fa-face-type ((t (:inherit (quote font-lock-type-face) :background "#3f3f3f"))))
 '(fa-face-type-bold ((t (:inherit (quote font-lock-type-face) :background "#999999" :bold t)))))

(setq-default line-spacing 1)

;; Initial frame
(setq initial-frame-alist
      (append (list
	       '(foreground-color . "black")
	       ;;'(background-color . "LemonChiffon")
	       '(background-color . "white")
	       ;;'(background-color . "gray")
	       '(border-color . "black")
	       '(mouse-color . "white")
	       '(cursor-color . "black")
	       ;; True type font set configuration
	       ;;'(font . "private-fontset")            ; TrueType font
	       ;;'(ime-font . "tt16-japanese-jisx0208") ; IME font set
	       ;; Small font set configuration
	       ;;		    '(font . "small-fontset"); TrueType font
	       ;;		    '(ime-font . "Nihongo-9") ; IME font set
	       '(width . 100)
	       '(height . 50)
	       ;;		    '(top . 0)
	       ;;		    '(left . 0)
	       ;; '(font . "win-14")
	       ;;'(ime-font . "win-16-arial") ;; Nihongo-14
	       )
	      default-frame-alist))

;; Perforce
(require 'p4)

;;;;; flycheck
;;(use-package flycheck
;;  :ensure t
;;  :defer t
;;  :init
;;  ;; Enable flycheck for all buffers.
;;  (add-hook 'after-init-hook 'global-flycheck-mode)
;;  :config
;;  (progn
;;    ;; Highlight whole line with error.
;;    (setq flycheck-highlighting-mode 'lines)
;;
;;    ;; Display error messages on one line in minibuffer and by new lines
;;    ;; separated in `flycheck-error-message-buffer'.
;;
;;    (require 'subr-x)
;;    (require 'dash)
;;
;;    (defun flycheck-diplay-error-messages-one-line (errors)
;;      (-when-let (messages (-keep #'flycheck-error-message errors))
;;        (when (flycheck-may-use-echo-area-p)
;;          (message (string-join messages " | "))
;;          (with-current-buffer (get-buffer-create flycheck-error-message-buffer)
;;            (erase-buffer)
;;            (insert (string-join messages "\n\n"))))))
;;
;;    (setq flycheck-display-errors-function
;;          'flycheck-diplay-error-messages-one-line)
;;
;;    ;; Integration with cask files.
;;    (add-hook 'flycheck-mode-hook 'flycheck-cask-setup)))
;;
;;(provide 'setup-flycheck)

;;;; flymake
;;(require 'flymake)
;;
;;(defun flymake-vc-init ()
;;  (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                     'flymake-create-temp-inplace))
;;         (local-file (file-relative-name
;;                      temp-file
;;                      (file-name-directory buffer-file-name))))
;;	(list "cl" (list "/nologo" "/W4" "/Wp64" "/Zs" local-file))))
;;(push '("\\.c\\'" flymake-vc-init) flymake-allowed-file-name-masks)
;;(push '("\\.cpp\\'" flymake-vc-init) flymake-allowed-file-name-masks)
;;
;;(add-hook 'c++-mode-hook
;;          '(lambda ()
;;             (flymake-mode t)))
;;

;;;; c/c++ refactoring
;;(require 'srefactor)
;;(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
;;(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)

;; align equal signs
(defun align-to-equals (begin end)
  "Align region to equal signs"
   (interactive "r")
   (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))
(global-set-key (kbd "C-x a =") 'align-to-equals)

;; auto complete
(require 'auto-complete)
(require 'auto-complete-config)  
(global-auto-complete-mode t)


;; auto-complete-c-headers
;;(require 'auto-complete-c-headers)
;;(add-hook 'c++-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))
;;(add-hook 'c-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))

;; function-args 
(require 'function-args)
(fa-config-default)
;; 
;;(define-key function-args-mode-map (kbd "M-o") nil)
;;(define-key c-mode-map (kbd "C-M-:") 'moo-complete)
;;(define-key c++-mode-map (kbd "C-M-:") 'moo-complete)
;;   
;;(custom-set-faces
;; '(fa-face-hint ((t (:background "#3f3f3f" :foreground "#ffffff"))))
;; '(fa-face-hint-bold ((t (:background "#3f3f3f" :weight bold))))
;; '(fa-face-semi ((t (:background "#3f3f3f" :foreground "#ffffff" :weight bold))))
;; '(fa-face-type ((t (:inherit (quote font-lock-type-face) :background "#3f3f3f"))))
;; '(fa-face-type-bold ((t (:inherit (quote font-lock-type-face) :background "#999999" :bold t)))))

;; ggtag
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

;;;; use helm
;;(setq ggtags-completing-read-function nil)
;;(require 'helm-config)
;;(helm-mode 1)
;;(custom-set-variables '(helm-ff-auto-update-initial-value nil))
;;(define-key helm-c-read-file-map (kbd "C-h") 'delete-backward-char)
;;(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;;(require 'helm-gtags)
;;(add-hook 'helm-gtags-mode-hook
;;'(lambda ()
;;   ;;find tag
;;   (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
;;
;;   ;;find place referring the tag
;;   (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)  
;;   
;;   ;;Jump to symbol ref
;;   (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
;;   
;;   ;;Tag list and jump
;;   (local-set-key (kbd "M-l") 'helm-gtags-select)
;;
;;   ;;Return to before jump
;;   (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))
;;
;;(add-hook 'c++-mode-hook 'helm-gtags-mode)

;; 
;;;; use eldoc
(setq-local eldoc-documentation-function #'ggtags-eldoc-function)
;; 
;; imenu
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
 
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
 
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; go to definition/reference (flexible by context)
(define-key ggtags-mode-map (kbd "C-c C-g") 'ggtags-find-tag-dwim)
;; search tag
(define-key ggtags-mode-map (kbd "C-c C-s") 'ggtags-find-tag-regexp)
;; go to definition
(define-key ggtags-mode-map (kbd "C-c g d") 'ggtags-find-definition)
;; go to references
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;;(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;;(define-key ggtags-mode-map (kbd "<f7>") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; GUD keybind change like MSVS
(add-hook 'gud-mode-hook
          '(lambda ()
             (global-set-key (kbd "<C-f5>")  'gud-until) ;; continue to current line
             (global-set-key (kbd "<f5>")  'gud-cont) ;; continue to next berak
             (global-set-key (kbd "<f9>")  'gud-break) ;; add break point
             (global-set-key (kbd "<f7>")  'gud-finish) ;; finish
             (global-set-key (kbd "<C-f9>")  'gud-remove) ;; remove break point
             (global-set-key (kbd "<f8>")  'gud-print) ;; print value
             (global-set-key (kbd "<f10>") 'gud-next)
             (global-set-key (kbd "<f11>") 'gud-step)))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 90 :width normal))))
 '(fa-face-hint ((t (:background "#3f3f3f" :foreground "#ffffff"))))
 '(fa-face-hint-bold ((t (:background "#3f3f3f" :weight bold))))
 '(fa-face-semi ((t (:background "#3f3f3f" :foreground "#ffffff" :weight bold))))
 '(fa-face-type ((t (:inherit (quote font-lock-type-face) :background "#3f3f3f"))))
 '(fa-face-type-bold ((t (:inherit (quote font-lock-type-face) :background "#999999" :bold t)))))


;;;
;;; end of file
;;;



