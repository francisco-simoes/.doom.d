;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Francisco Simoes"
      user-mail-address "francisconfqsimoes@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-vibrant)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; :::::::::::::::: MINE ::::::::::::::::::
;; No transparency
(add-to-list 'default-frame-alist '(alpha 100))

;; org-super-agenda (NOT WORKING I don't know why)
;; (use-package! org-super-agenda
;;   :after org-agenda
;;   :init
;;   (setq org-super-agenda-groups '((:name "Today"
;;                                         :time-grid t
;;                                         :scheduled today)
;;                                 (:name "Due today"
;;                                         :deadline today)
;;                                 (:name "Important"
;;                                         :priority "A")
;;                                 (:name "Overdue"
;;                                         :deadline past)
;;                                 (:name "Due soon"
;;                                         :deadline future)
;;                                 (:name "Big Outcomes"
;;                                         :tag "bo")))
;;   :config
;;   (org-super-agenda-mode))


;; Set default pdflatex command to be latexmk to compile bibtex
(setq pdf-latex-command "latexmk")


;; ;; evil-multiedit default keybindings
;; ;; Highlights all matches of the selection in the buffer.
;; (define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; ;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; ;; incrementally add the next unmatched match.
;; (define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; ;; Match selected region.
;; (define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; ;; Insert marker at point
;; (define-key evil-insert-state-map (kbd "M-d") 'evil-multiedit-toggle-marker-here)

;; ;; Same as M-d but in reverse.
;; (define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
;; (define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

;; ;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; ;; `evil-multiedit-match-symbol-and-next` (or prev).

;; ;; Restore the last group of multiedit regions.
;; (define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; ;; RET will toggle the region under the cursor
;; (define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ;; ...and in visual mode, RET will disable all fields outside the selected region
;; (define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ;; For moving between edit regions
;; (define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
;; (define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; ;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
;; (evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)


;; Add a load-path
(add-to-list 'load-path "~/.doom.d/load")

;; Python autocompletion
;; (use-package lsp-python-ms
;;   :ensure t
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-python-ms)
;;                           (lsp))))  ; or lsp-deferred


;; Python linting
(add-hook! 'lsp-mode-hook
(flycheck-add-next-checker 'lsp '(warning . python-mypy))
(flycheck-add-next-checker 'lsp '(warning . python-flake8)))
;; venv + flake8 and mypy compatibility
;; (defun set-flychecker-executables ()
;;   "Configure virtualenv for flake8 and lint."
;;   (when (get-current-buffer-flake8)
;;     (flycheck-set-checker-executable (quote python-flake8)
;;                                      (get-current-buffer-flake8)))
;;   (when (get-current-buffer-pylint)
;;     (flycheck-set-checker-executable (quote python-pylint)
;;                                      (get-current-buffer-pylint))))
;; (add-hook 'flycheck-before-syntax-check-hook
;;           #'set-flychecker-executables 'local)

;; Python fixing with yapf (on save or on command)
;; (setq-hook! 'python-mode-hook +format-with 'yapf)
(use-package! yapfify
  :hook
  (python-mode . yapf-mode)
  (before-save . (lambda ()
                   (when (eq major-mode 'python-mode)
                     (yapify-buffer)))))
;; Use ipython as python REPL ; matplotlib does not work in that case!
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;; (setq python-shell-interpreter "python"
;;         python-shell-interpreter-args "-m IPython"
;;         python-shell-prompt-detect-failure-warning nil
;;         python-shell-completion-native-enable nil)


;; Relative numbers
(setq display-line-numbers-type 'relative)


;; Org-mode stuff
(defun org-convert-plain-lines-to-checklist (beg end)
  "Convert all plain lines in region to a plain list with
checkboxes."
  (interactive "r")
  (save-excursion
    (goto-char beg)
    (dotimes (_ (- (line-number-at-pos end) (line-number-at-pos beg)))
      (insert "- [ ] ")
      (indent-according-to-mode)
      (forward-line 1))))

;; Make links to pdf files open correctly:
(setq process-connection-type nil)

;; Closed todo's with timestamp
(setq org-log-done 'time)

;; Set todo keywods
;; (The `!` after INPROGRESS enforces the creation of a time-stamp.)
;; (The `@` after WAITING enforces the creation of a note.)
(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i!)" "WAITING(w@)" "IDEA(I)" "PROJECT(p)" "|" "DONE(d)" "CANCELLED(c)")))
        (setq org-todo-keyword-faces
        '(("TODO" :foreground "yellow" :weight bold)
                ("INPROGRESS" :foreground "magenta" :weight bold)
                ("WAITING" :foreground "purple" :weight bold)
                ("IDEA" :foreground "yellow" :weight normal)
                ("PROJECT" :foreground "white" :weight bold)
                ("DONE"  :foreground "green" :weight normal)
                ("CANCELLED" :foreground "red" :weight normal)))
        )

;; Set agenda files
(setq org-agenda-files '("~/org/" "~/org/OrbiskTodos/"))

;; Prettier bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Snippets with yasnippet
;; Add directory with perdonal snippets
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.doom.d/snippets")))
;; Redefine snippet key to avoid conflicts with autocompletion
;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)
;; (define-key yas-minor-mode-map (kbd "<the new key>") yas-maybe-expand)
;; (map! :i [tab] (cmds! (featurep! :editor snippets)
;;                            (bound-and-true-p yas-minor-mode)
;;                            (yas-maybe-expand-abbrev-key-filter 'yas-expand)))

;; Fancy symbols for priorities
(use-package org-fancy-priorities
  :ensure t
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("△" "◇" "▽")))
;; Fancy symbol for hidden content
(defun whitespace-change-ellipsis ()
    "Change ellipsis when used with `whitespace-mode'."
    (when buffer-display-table
      (set-display-table-slot buffer-display-table
                              'selective-display
                              ;; (string-to-vector " ◦◦◦ "))))
                              (string-to-vector " [↴↴↴] "))))
  (add-hook 'whitespace-mode-hook #'whitespace-change-ellipsis)


;; Pdf stuff
(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))
;; Export on save
;; (defun org-latex-continuous-export-to-pdf ()
;;         (interactive)
;;         (add-hook 'after-save-hook 'org-latex-export-to-pdf t t)
;;         (message "Auto-export enabled"))
(defun org-export-pdf-then-open()
   ;;(org-open-file (org-latex-export-to-pdf) t) ) ; open pdf in emacs.
   (org-open-file t (org-latex-export-to-pdf)) ) ; open pdf in emacs.
   ;; (org-open-file (org-latex-export-to-pdf)) )
(defun org-continuous-export-to-pdf()
  "auto export to pdf when saving an org file"
  (interactive)
  (when (eq major-mode 'org-mode)
    (add-hook 'after-save-hook 'org-export-pdf-then-open t t)
    )
)


;; Misc
;; Word-wrapping
(setq word-wrap t)
