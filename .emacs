;; enable MELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; enable ido everywhere
;; see: http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1) 

;; enable projectile everywhere
;; https://github.com/bbatsov/projectile
(require 'projectile)	   
(projectile-global-mode)

;; enable undo-tree everywhere
;; http://www.dr-qubit.org/emacs.php
(require 'undo-tree)
(global-undo-tree-mode 1)
(global-set-key (kbd "C-z") 'undo)

;; flexible comments
;; http://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)

;; fast cursor moving
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; haskell mode hooks
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;; disable toolbar
(menu-bar-mode -1)
