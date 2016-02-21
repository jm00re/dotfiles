;; turn on packages
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; other requires
(require 'evil)
(require 'evil-leader)

;; enable evil-mode on startup
(evil-mode t)
;; enable evil-leader for all evil-mode buffers
(global-evil-leader-mode)
;; enable linenums globally
(global-linum-mode)
;; enable tildes at end of buffer
(global-vim-empty-lines-mode)
;; show matching parents
(show-paren-mode t)
;; change leader key to ,
(evil-leader/set-leader ",")

;; leader key mappings
(evil-leader/set-key
  "y" 'pbcopy
  "p" 'pbpaste
  "w" 'evil-write
  "q" 'evil-quit
  "e" 'eshell
  "v" 'split-window-right
  "h" 'split-window-below)

;; macro for breaking lines in normal mode
(fset 'break-line
   [?i ?\C-m escape])

;; macro for inserting newline with enter
(fset 'insert-newline
   [?o escape])

;; adding back some vim movement that my hands need
(define-key evil-motion-state-map "H" 'evil-beginning-of-line)
(define-key evil-motion-state-map "L" 'evil-end-of-line)

;; make window movement make sense
;; (when (fboundp 'windmove-default-keybindings)
;;   (windmove-default-keybindings))
;; (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
;; (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
;; (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
;; (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)

;; add normal mode line break
(define-key evil-normal-state-map (kbd "K") 'break-line)
(define-key evil-normal-state-map (kbd "RET") 'insert-newline)

;; adding helm space mappings
(define-key evil-normal-state-map (kbd "<SPC>n") 'helm-find-files)
(define-key evil-normal-state-map (kbd "<SPC>b") 'helm-buffers-list)

;; This gives me an easy set of functions to copy and paste from clipboard
(defun pbcopy ()
 (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

;; set spacemacs as the theme
(load-theme 'base16-default-dark t)

;; remove menu bar
(menu-bar-mode -1)

;; make scrolling smooth
(setq scroll-margin 1
scroll-conservatively 9999
scroll-step 1)

;; Add a space between line number and text
(setq linum-format "%d ")

;; switch yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; esc quits
;; http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/ 
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
   In Delete Selection mode, if the mark is active, just deactivate it;
   then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; helm prefs
;; TODO
;; Figure out how to make ESC quit helm buffer
    ;; (define-key helm-map (kbd "ESC") 'helm-keyboard-quit)
;; Make it fill current window with completetion reqs
(require 'helm)
(require 'helm-config)

(setq helm-split-window-in-side-p t 
      helm-move-to-line-cycle-in-source t )

(helm-mode t)

;; Hide passwords in eshell
;; (add-hook 'comint-output-filter-functions
;; 'comint-watch-for-password-prompt)

;; Rainbow parens always
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; drop into an eshell buffer on startup
(eshell)

