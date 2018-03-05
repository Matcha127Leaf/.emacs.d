;;;; Do not open another window if Meadow is already executed
(setq gnuserv-frame (selected-frame))

;; For meadow
;;; font-lock --> Colorful
(if window-system
    (progn
      (setq font-lock-support-mode 
	    '((t . jit-lock-mode)))
      (global-font-lock-mode t)))

;;; font-lock --> Colorful
(if window-system
    (progn
      (setq font-lock-support-mode 
	    '((t . jit-lock-mode)))
      (global-font-lock-mode t)))

;;; Japanese Language IME
(set-language-environment "Japanese")
(mw32-ime-initialize)
(setq default-input-method "MW32-IME")
(setq-default mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
(add-hook 'mw32-ime-on-hook
	  (function (lambda () (set-cursor-height 2))))
(add-hook 'mw32-ime-off-hook
	  (function (lambda () (set-cursor-height 4))))

;; Font set
(w32-add-font
 "win-14"
 '((strict-spec
  ((:char-spec ascii :height any)
   (w32-logfont "Courier New" 7 14 400 0 nil nil nil 0 1 3 49))
  ((:char-spec japanese-jisx0208 :height any)
   (w32-logfont "ＭＳ ゴシック" 0 -14 400 0 nil nil nil 128 1 3 49))
  ((:char-spec japanese-jisx0208 :height any :slant italic)
   (w32-logfont "ＭＳ 明朝" 0 -14 400 0 nil nil nil 128 1 3 17))
  )))

(w32-add-font
 "win-16"
 '((strict-spec
  ((:char-spec ascii :height any)
   (w32-logfont "Courier New" 8 16 400 0 nil nil nil 0 1 3 49))
  ((:char-spec japanese-jisx0208 :height any)
   (w32-logfont "ＭＳ ゴシック" 0 -15 400 0 nil nil nil 128 1 3 49))
  ((:char-spec japanese-jisx0208 :height any :slant italic)
   (w32-logfont "ＭＳ 明朝" 0 -15 400 0 nil nil nil 128 1 3 17))
  )))

;;;; Font set configuration 
;; ;;; TrueType Font set "private-fontset"
(create-fontset-from-request "private-fontset"
 			     '((width . 6) ; font width in pixel
 			       (height . 10) ; font heigh in pixel
 			       (fixed . t) ; Constant width
			       (weight . 400) ; normal400, bold700
 			       (italic . nil))
 			     '((family . "ＭＳ ゴシック")
			       ;;(family . "Andale Mono")
 			       (family . "Courier New")))


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
	       ;;		    '(width . 100)
	       ;;		    '(height . 50)
	       ;;		    '(top . 0)
	       ;;		    '(left . 0)
	       '(font . "win-14")
	       ;;'(ime-font . "win-16-arial") ;; Nihongo-14
	       )
	      default-frame-alist))


;; Meadow
;;; argument-editing
(require 'mw32script)
(mw32script-init)

;;;
;;; end of file
;;;



