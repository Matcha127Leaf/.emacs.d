
(custom-set-variables
 '(initial-frame-alist
   (quote
    ((width . 100)
     (height . 50)
     (top . 50)
     (left . 100))))
 '(package-selected-packages
   (quote
    (flycheck-pyflakes flymake-cursor flymake-python-pyflakes py-autopep8 python-mode))))

;;;; Server Start
(require 'server)
(unless (server-running-p)
  (server-start))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;;
;;; end of file
;;;



