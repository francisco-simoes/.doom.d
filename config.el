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
;; (setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-tomorrow-night)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; No global mode line
(global-hide-mode-line-mode)

;; Make mode line smaller
;; (set-face-attribute 'mode-line nil :height 0.9)
;; (set-face-attribute 'mode-line-inactive nil :height 0.9)

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
;; Agenda on start up
(add-hook 'after-init-hook 'org-agenda-list)

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
;; (setq pdf-latex-command "latexmk -shell-escape -bibtex -f -pdf %f")

;; Do not hide anything from dired
(remove-hook 'dired-mode-hook #'dired-omit-mode)


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

;; ===================================
;; Python
;; ===================================

;; Add correct pyenv path
(setq exec-path (append exec-path '("~/.pyenv/bin")))

(setq flycheck-flake8rc "~/.config/flake8")
;; ::::::::::::::::::::::::::::::::
;; LSP IDE
;; ::::::::::::::::::::::::::::::::
; Use flake8 instead of pycodestyle for linting
;; (setq lsp-pylsp-configuration-sources ["flake8" "mypy"]) ;; mypy doesn't seem to be working despite me doing this...
(setq lsp-pylsp-configuration-sources ["flake8"])
; Flychecker will take care of typing linting

(add-hook! 'lsp-mode-hook
  (setq lsp-ui-doc-position 'top)
)

;; (add-to-list 'flycheck-checkers 'python-mypy t)

;; ;; Python linting
;; (add-hook! 'lsp-mode-hook
;;         (flycheck-select-checker 'python-flake8)
        ;; (flycheck-add-next-checker 'python-flake8 'python-mypy)
;;         ;; (flycheck-add-next-checker 'lsp '(warning . python-mypy))
;;         ;; (flycheck-add-next-checker 'lsp '(warning . python-flake8))
;; )


;; Format with black on save
(add-hook! 'python-mode-hook
           (python-black-on-save-mode t)
           (add-hook! 'before-save-hook 'py-isort-before-save)
)


(defun fsimoes-lsp-see-pipenv ()
 (interactive "@")
 (pipenv-deactivate)
 (pipenv-activate)
 (lsp-restart-workspace))


;; (add-hook! 'after-save-hook
;;   (py-isort-buffer)
;; )

;; easy print current word
(fset 'fsimoes-print-this
   (kmacro-lambda-form [?y ?i ?o ?o ?p ?r ?i ?n ?t ?\( ?f ?\" escape ?p ?a ?  ?= ?  ?\{ escape ?p ?f ?\} ?a ?\" escape ?x ?$] 0 "%d"))

;; ;; Python autocompletion
;; ;; (use-package lsp-python-ms
;; ;;   :ensure t
;; ;;   :init (setq lsp-python-ms-auto-install-server t)
;; ;;   :hook (python-mode . (lambda ()
;; ;;                           (require 'lsp-python-ms)
;; ;;                           (lsp))))  ; or lsp-deferred

;; ;; No warning when opening Python REPL:
;; (setq python-shell-prompt-detect-failure-warning nil)
;; ;; (setq python-shell-completion-native-enable nil) ; messes up venv...


;; ;; Python fixing with yapf (on save or on command)
;; ;; (setq-hook! 'python-mode-hook +format-with 'yapf)
;; (use-package! yapfify
;;   :hook
;;   (python-mode . yapf-mode)
;;   (before-save . (lambda ()
;;                    (when (eq major-mode 'python-mode)
;;                      (yapify-buffer)))))

;; Elpy IDE ::::::::::::::::::::::::::::::::
;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable)
;;   )
;; (setq elpy-rpc-python-command "python3")
;; ;; (setq python-shell-interpreter "~/Environments/emacs_main/bin/python3") ;; This is what `C-c C-c` will use
;; ;; Enable Flycheck
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; ;; ;; Enable autopep8 on save
;; ;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; ;; Enable yapf on save
;; (use-package! yapfify
;;   :hook
;;   (elpy-mode . yapf-mode)
;;   (before-save . (lambda ()
;;                    (when (eq major-mode 'elpy-mode)
;;                      (yapify-buffer)))))

;; ;; Disable pylint as checker
(setq-default flycheck-disabled-checkers '(python-pylint))

;; ===================================
;; Org-mode stuff
;; ===================================
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
;; Closed todo's without timestamp:
;; (setq org-log-done nil)

;; Set todo keywods
;; (The `!` after INPROGRESS enforces the creation of a time-stamp.)
;; (The `@` after WAITING enforces the creation of a note.)
(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i!)" "WAITING(w@)" "RECURRENT(r)" "IDEA(I)" "QUESTION(q)" "|" "DONE(d)" "CANCELLED(c)" "POSTPONED(P)" "ANSWER(a)" "PARTIAL(p)")))
        (setq org-todo-keyword-faces
        '(("TODO" :foreground "orange" :weight bold)
                ("INPROGRESS" :foreground "dark magenta" :weight bold)
                ("RECURRENT" :foreground "orange" :weight normal)
                ("IDEA" :foreground "gold" :weight normal)
                ("QUESTION" :foreground "dark goldenrod" :weight normal)
                ("DONE"  :foreground "olive drab" :weight normal)
                ("CANCELLED" :foreground "firebrick" :weight normal)
                ("WAITING" :foreground "purple" :weight bold)
                ("POSTPONED" :foreground "DarkOrange4" :weight normal)
                ("ANSWER" :foreground "tomato" :weight normal)
                ("PARTIAL" :foreground "dark olive green" :weight normal)))
        )

;; Set agenda files

;; First get files under "ExplorationIdeas" with todos
(defvar explorationideas-todos (directory-files-recursively "~/Documents/Notes/ExplorationIdeas/" ".*todos.*")) ;; All files names ...todos...
;; (setq explorationideas-todos '(seq-filter 'file-directory-p (directory-files-recursively "~/Documents/Notes/ExplorationIdeas/" "" t))) ;; If I wanted ALL subdirectories

(setq org-agenda-files (append '("~/org/" "~/Documents/Notes/" "~/Documents/Notes/Organization/"  "~/Documents/Notes/Organization/Archive/") explorationideas-todos))
;; Set deadline warning days to 3 instead of the default 14, so that a deadline shows in org-agenda 3 days prior
(setq org-deadline-warning-days 3)

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
                              ;; (string-to-vector " [↴↴↴] "))))
                              (string-to-vector " ▼"))))
(add-hook 'whitespace-mode-hook #'whitespace-change-ellipsis)

(defun orgmode-change-ellipsis ()
  "Change ellipsis when entering `org-mode'."
  (set-display-table-slot standard-display-table
                          'selective-display
                          (string-to-vector " ▼")))
(add-hook 'org-mode-hook #'orgmode-change-ellipsis)


;; Pdf stuff
;; (use-package pdf-tools
;;   :ensure t
;;   :config
;;   (pdf-tools-install))
;; Export on save
;; (defun org-latex-continuous-export-to-pdf ()
;;         (interactive)
;;         (add-hook 'after-save-hook 'org-latex-export-to-pdf t t)
;;         (message "Auto-export enabled"))
;;
;; (defun org-export-pdf-then-open()
;;    ;;(org-open-file (org-latex-export-to-pdf) t) ) ; open pdf in emacs.
;;    (org-open-file t (org-latex-export-to-pdf)) ) ; open pdf in emacs.
;;    ;; (org-open-file (org-latex-export-to-pdf)) )
;; (defun org-continuous-export-to-pdf()
;;   "auto export to pdf when saving an org file"
;;   (interactive)
;;   (when (eq major-mode 'org-mode)
;;     (add-hook 'after-save-hook 'org-export-pdf-then-open t t)
;;     )
;; )
;; Font sizes for headings
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-7 . 1.1)))
  ;; (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face))
  (set-face-attribute (car face) nil :weight 'regular :height (cdr face))
  )
;;
;; Shorter global todo list
(setq org-agenda-todo-list-sublevels nil)
;;
;; Don't dim blocked todos
(setq org-agenda-dim-blocked-tasks nil)
;;
;; Syntax highlighting when exporting
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)
;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;;
(setq org-src-fontify-natively t)
;;
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (latex . t)))
;;
;; Bibtex citations exported
(require 'ox-bibtex)
;; (setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
(setq reftex-default-bibliography '("~/Documents/Library/library.bib"))

;;
;; Add a latex class
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
        '("org-plain-latex"
               "\\documentclass{article}
                [NO-DEFAULT-PACKAGES]
                [PACKAGES]
                [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
        '("fsimoes-org-not-so-plain-latex"
               "\\documentclass{article}
                [NO-DEFAULT-PACKAGES]
                [PACKAGES]
                [EXTRA]
                \\usepackage[authoryear,square,longnamesfirst]{natbib}
                \\usepackage[utf8]{inputenc}
                \\usepackage[T1]{fontenc}
                \\usepackage{graphicx}
                \\usepackage{longtable}
                \\usepackage{hyperref}
                \\usepackage{amssymb}
                \\usepackage{amsmath}
                \\usepackage{geometry}
                \\geometry{a4paper,left=1.5cm,top=1cm,right=1.5cm,bottom=1cm,marginparsep=7pt, marginparwidth=.6in}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
        '("bjmarticle"
               "\\documentclass{article}
                \\usepackage[authoryear,square,longnamesfirst]{natbib}
                \\usepackage[utf8]{inputenc}
                \\usepackage[T1]{fontenc}
                \\usepackage{graphicx}
                \\usepackage{longtable}
                \\usepackage{hyperref}
                \\usepackage{amssymb}
                \\usepackage{amsmath}
                \\usepackage{geometry}
                \\geometry{a4paper,left=1.5cm,top=1cm,right=1.5cm,bottom=1cm,marginparsep=7pt, marginparwidth=.6in}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )

;;
;; Latex syntax highlighting in org mode
(setq org-highlight-latex-and-related '(latex script entities))
;;
;; cdlatex turned on for org files
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;; ;; Normal paragraphs within latex files
;; (defun my-LaTeX-mode-hook()
;;     (setq paragraph-start "\f\\|[ 	]*$")
;;     (setq paragraph-separate "[ 	\f]*$"))
;; (add-hook 'TeX-PDF-mode-hook 'my-LaTeX-mode-hook)

;; ===================================
;; Misc
;; ===================================
;; Word-wrapping
(visual-line-mode 1)
;;
;;
;; Undo ======
;; evil registers actions using emacs heuristics instead of at normal state activation
(setq evil-want-fine-undo t)
;; activate undo-in-region for undo-fu
;; (sacrificing some undo/redo functionality)
(setq undo-fu-allow-undo-in-region t)
;; C-g does not enable non-linear behaviour for undo-fu.
;; (instead, one must use undo-fu-disable-checkpoint)
(setq undo-fu-ignore-keyboard-quit t)

;; ;; Undo with undo-tree
;; (use-package! undo-tree
;;   :ensure t
;;   :init
;;   (global-undo-tree-mode)
;;   :config
;;   (setq undo-tree-enable-undo-in-region nil)
;;   (setq undo-tree-visualizer-diff t)
;;         (defun undo-tree-visualizer-quit ()
;;         "Quit the undo-tree visualizer."
;;         (interactive)
;;         (unless (eq major-mode 'undo-tree-visualizer-mode)
;;         (user-error "Undo-tree mode not enabled in buffer"))
;;         (undo-tree-clear-visualizer-data buffer-undo-tree)
;;         ;; remove kill visualizer hook from parent buffer
;;         (unwind-protect
;;         (with-current-buffer undo-tree-visualizer-parent-buffer
;;                 (remove-hook 'before-change-functions 'undo-tree-kill-visualizer t))
;;         ;; kill diff buffer, if any
;;         (when undo-tree-visualizer-diff (undo-tree-visualizer-hide-diff))
;;         (let ((parent undo-tree-visualizer-parent-buffer)
;;                 window)
;;         ;; kill visualizer buffer - CANCELLED
;;         ;; (kill-buffer nil)
;;         ;; switch back to parent buffer
;;         (unwind-protect
;;                 (if (setq window (get-buffer-window parent))
;;                 (select-window window)
;;                 (switch-to-buffer parent))))))
;; )



;; Relative numbers
(setq display-line-numbers-type 'relative)

;; Avoid Python shell readline warning
(setq python-shell-completion-native-enable nil)

;; Set custom color of current line (not working IDK why..)
;; (require 'hl-line)
(global-hl-line-mode 1)
;; (set-face-background 'hl-line "#16167f")  ; blue

;; (set-face-foreground 'highlight nil)  ; keep syntax highlighting

;; (Re)load theme AFTER customizing hl-line
;; (load-theme 'doom-city-lights t)
;; (load-theme 'doom-spacegrey t)
;; (setq doom-spacegrey-brighter-comments t)
;; (load-theme 'doom-challenger-deep t)
;; (load-theme 'doom-one t)
;; (setq doom-challenger-deep-brighter-comments t)
;; (load-theme 'doom-acario-dark t)
(load-theme 'leuven t)
;; (setq doom-theme 'nil)

;; light gray as pdf background when using Leuven theme:
(defface my-special-face '((t :background "white smoke"))
  "My custom background.")
(add-hook 'pdf-view-mode-hook
        (lambda ()
                (if (eq doom-theme 'leuven)
                    ;; (set-background-color "white smoke")
                    (face-remap-add-relative 'default 'my-special-face)
                )
        )
)

;; Change directory to save the "desktops" in
(setq desktop-dirname "/home/fsimoes/.doom.d/desktop_save")
;; Make it save automatically
;; (desktop-save-mode 1)

;; ===================================
;; Custom keybindings
;; ===================================

;; Access previous commands after doing command-repeat
(map!
 :n "M-." #'evil-repeat-pop)
(map!
 :n "M->" #'evil-repeat-pop-next)

;; Go to pdf position corresponding to tex position
(map!
 :after latex
 :map latex-mode-map
 :desc "Go to pdf position"
 :leader
 :n "g p" #'pdf-sync-forward-search)

;; Go to tex position corresponding to pdf position
(map!
 :after pdf-view
 :map pdf-view-mode-map
 :desc "Go to tex position"
 :leader
 :n "g /" #'pdf-isearch-sync-backward)

;; Go to next begin of latex env
(defun fsimoes-latex-next-env-begin ()
  (interactive)
  (search-forward "\\begin{")
)
(map!
 :after latex
 :map latex-mode-map
 :desc "Go to next begin of latex env"
 :leader
 :n "] e" #'fsimoes-latex-next-env-begin)

;; Go to previous begin of latex env
(defun fsimoes-latex-previous-env-begin ()
  (interactive)
  (search-backward "\\begin{")
)
(map!
 :after latex
 :map latex-mode-map
 :desc "Go to previous begin of latex env"
 :leader
 :n "[ e" #'fsimoes-latex-previous-env-begin)

;; Go to previous end of latex env
(defun fsimoes-latex-previous-env-end ()
  (interactive)
  (search-backward "\\end{")
)
(map!
 :after latex
 :map latex-mode-map
 :desc "Go to previous end of latex env"
 :leader
 :n "[ E" #'fsimoes-latex-previous-env-end)

;; Go to next end of latex env
(defun fsimoes-latex-next-env-end ()
  (interactive)
  (search-forward "\\end{")
)
(map!
 :after latex
 :map latex-mode-map
 :desc "Go to next end of latex env"
 :leader
 :n "] E" #'fsimoes-latex-next-env-end)

(map!
 :leader
 :desc "Paste from kill ring"
 :n "k p" #'yank-from-kill-ring)

;; g0 to go to start of text in line
(map!
 :desc "Go to start of text in line"
 :n "g 0" #'beginning-of-line-text)

;; Run src block and go to next:
(defun execute-src-block-and-goto-next ()
  (interactive)
  (org-babel-execute-src-block)
  (org-babel-next-src-block))
;; (eval-after-load 'org
;;   (bind-key "C-c <C-return>" #'execute-src-block-and-goto-next org-mode-map))
(org-defkey org-mode-map (kbd "C-c <C-return>") 'execute-src-block-and-goto-next)

;; Split src block:
(org-defkey org-mode-map (kbd "C-c C--") 'jupyter-org-split-src-block)

;; Send region to REPL
(org-defkey org-mode-map (kbd "C-c r") 'python-shell-send-region)

;; Go to heading on level above. Good for org and latex (and anything that uses outline-mode)
(map!
 :desc "Go to heading one level up from current."
 ;; :nv "g [" #'outline-up-heading)
 :mv "g [" #'outline-up-heading)

;; Go to next/previous heading on same level. Good for org, latex, pdf outline (and anything that uses outline-mode)
;; (org already had this but the other modes didn't)
(map!
 :desc "Go to next heading on same level."
 :mv "] h" #'outline-forward-same-level)
(map!
 :desc "Go to previous heading on same level."
 :mv "[ h" #'outline-backward-same-level)

;; Go to next visible heading.
(map!
 :desc "Go to next visible heading."
 :mv "] v" #'outline-next-visible-heading)

;; Go to previous visible heading.
(map!
 :desc "Go to previous visible heading."
 :mv "[ v" #'outline-previous-visible-heading)

;; Scroll middle to top for confortable one-hand non-pdf reading
;; (same as "M" followed by "z t" but with right hand only)
(defun fsimoes-scroll-middle-to-top ()
 (interactive "@")
 (evil-window-middle)
 (evil-scroll-line-to-top (line-number-at-pos (point)))
)
(map!
 :desc "Scroll middle line to top."
 :m "C-," #'fsimoes-scroll-middle-to-top)

;; Toggle Hide-Mode-Line mode
(map!
 :leader
 :desc "Toggle Hide-Mode-Line mode"
 :m "t h" #'global-hide-mode-line-mode)

;; Insert section template in latex
(map!
 :map latex-mode-map
 :desc "Insert section template."
 :ni "C-c C-s" #'LaTeX-section)

;; pdf scroll up/down using capital K and J
(map!
 :map pdf-view-mode-map
 :desc "Scroll down."
 :ni "J" #'pdf-view-scroll-up-or-next-page)
(map!
 :map pdf-view-mode-map
 :desc "Scroll up."
 :ni "K" #'pdf-view-scroll-down-or-previous-page)

;; go backwards in pdf history
(map!
 :map pdf-view-mode-map
 :desc "Go backwards in pdf history."
 :ni "M-h" #'pdf-history-backward)

;; go forwards in pdf history
(map!
 :map pdf-view-mode-map
 :desc "Go forwards in pdf history."
 :ni "M-l" #'pdf-history-forward)

;; slice pdf using bounding box
(map!
 :leader
 :map pdf-view-mode-map
 :desc "Slice pdf using bounding box."
 :n "m s" #'pdf-view-set-slice-from-bounding-box)

;; mode to automaticall slice pdf using bounding box
(map!
 :leader
 :map pdf-view-mode-map
 :desc "Automatically slice pdf pages using bounding box."
 :n "m a" #'pdf-view-auto-slice-minor-mode)

;; reset pdf slice
(map!
 :leader
 :map pdf-view-mode-map
 :desc "Reset pdf slice."
 :n "m r" #'pdf-view-reset-slice)

;; slice pdf with mouse
(map!
 :leader
 :map pdf-view-mode-map
 :desc "Slice pdf using mouse."
 :n "m m" #'pdf-view-set-slice-using-mouse)

;; hightlight in pdf with mouse
(map!
 :map pdf-view-mode-map
 :desc "Hightlight in pdf with mouse."
 :n "<mouse-8>" #'pdf-annot-add-highlight-markup-annotation)

;; store link
(map!
 :leader
 :desc "Store link."
 :n "l s" #'org-store-link)
(map!
 :leader
 :desc "Insert link."
 :n "l i" #'org-insert-link)

;; open library bibtex entries
(map!
 :leader
 :desc "Search bibtex entries using ivy."
 :n "o i" #'ivy-bibtex)

;; cite in org
(map!
 :leader
 :map org-mode-map
 :desc "Cite bibtex entries using ivy."
 :n "m i" #'org-ref-cite-insert-ivy)

;; Create empty file when in dired mode
(map!
 :leader
 :map dired-mode-map
 :desc "Create empty file."
 :n "f c" #'dired-create-empty-file)

;; Custom functions
;; ===================================
;; Send python current line to REPL
;; (defun python-shell-send-line ()
;;   "Execute current line in the REPL"
;;   (interactive)
;;   (evil-visual-line)
;;   (python-shell-send-region)
;;   (evil-normal-state))


(defun fsimoes-open-xfce-terminal ()
  (interactive "@")
  (shell-command (concat "xfce4-terminal"
              " > /dev/null 2>&1 & disown") nil nil))

;; use paragraphs as in classic vim - do not let modes edit it
(with-eval-after-load 'evil
  (defadvice forward-evil-paragraph (around default-values activate)
    (let ((paragraph-start (default-value 'paragraph-start))
          (paragraph-separate (default-value 'paragraph-separate)))
      ad-do-it)))

;; ispell will use default dictionary if personal dictionary is set to nil.
(add-hook 'ispell-initialize-spellchecker-hook (lambda () (setq ispell-personal-dictionary 'nil)))


;; Open pdf links within emacs
(add-to-list 'org-file-apps
             '("\\.pdf\\'" . emacs))

;; ivy-bibtex config following https://github.com/tmalsburg/helm-bibtex
;; ivy-bibtex requires ivy's `ivy--regex-ignore-order` regex builder
(autoload 'ivy-bibtex "ivy-bibtex" "" t)
;; ivy-bibtex requires ivy's `ivy--regex-ignore-order` regex builder
(setq ivy-re-builders-alist
      '((ivy-bibtex . ivy--regex-ignore-order)
        (t . ivy--regex-plus)))
;;
(setq bibtex-completion-bibliography "~/Documents/Library/library.bib")
(setq bibtex-completion-library-path '("~/Documents/Library/CausalInference"
                                       "~/Documents/Library/Calculus"
                                       "~/Documents/Library/CRL"
                                       "~/Documents/Library/GameTheory"
                                       "~/Documents/Library/ML"
                                       "~/Documents/Library/Stats"
                                       "~/Documents/Library/ComputerScience"
                                       "~/Documents/Library/Graphs"
                                       "~/Documents/Library/Physics"
                                       "~/Documents/Library/Philosophy"
                                       "~/Documents/Library/Probability"
                                       "~/Documents/Library/Algebra"
                                       "~/Documents/Library/RL"))

;; One notes file per publication
(setq bibtex-completion-notes-path "~/Documents/Notes/LibraryNotes")
;; org-noter should use the same path
(setq org-noter-notes-search-path '("~/Documents/Notes/LibraryNotes"))

;; Get org-ref to play nice with ivy-bibtex (from https://github.com/jkitchin/org-ref#configuration)
(require 'org-ref-ivy)
(setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
      org-ref-insert-cite-function 'org-ref-cite-insert-ivy
      org-ref-insert-label-function 'org-ref-insert-label-link
      org-ref-insert-ref-function 'org-ref-insert-ref-link
      org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))

;; Org roam https://www.youtube.com/watch?v=rH3ZH95zjKM
(setq org-roam-directory "~/Documents/Notes/Roam")

;; Children inherit priority from parents (not working I think)
(setq org-use-property-inheritance '("PRIORITY"))



;; Save notes from org-noter in the same directory as bibtex-completion
;; (setq org-noter?????? "~/Documents/Notes/LibraryNotes")

;; Latex fragments across entire org buffer
(defun fsimoes-org-latex-preview-buffer ()
  (interactive "@")
  (org-latex-preview '(16)))
;; Keybind the above function
(map!
 :map org-mode-map
 :desc "Buffer-wide Latex previews"
 :leader
 :n "m L" #'fsimoes-org-latex-preview-buffer)

;; Latex files hooks for proper initializaiton!
(defun fsimoes-latex-activate-outline-and-hide-body ()
  (interactive "@")
  (outline-minor-mode 1)
  (outline-hide-body) ;; fold all sections
)

(defun fsimoes-latex-activate-folding-and-hide-buffer ()
  (interactive "@")
  (TeX-fold-mode 1)
  (TeX-fold-buffer) ;; fold envs and macros
)

(defun fsimoes-latex-neat-folding ()
  (interactive "@")
  (setq font-latex-fontify-sectioning 1.3)
  (font-latex-update-sectioning-faces)
  (fsimoes-latex-activate-outline-and-hide-body)
  (fsimoes-latex-activate-folding-and-hide-buffer)
)
;; Keybind the above function
(map!
 :map org-mode-map
 :desc "Neat folding: pretty sections + folds."
 :leader
 :n "m n" #'fsimoes-latex-neat-folding)

(add-hook 'latex-mode #'fsimoes-latex-neat-folding)


;; Auctex plays nicely with minted if the tex command uses the shell-escape option
(add-hook 'TeX-mode-hook
  (lambda ()
    (setq TeX-command-extra-options "-shell-escape")
  )
)

;; ;; Add pipe, slash and dollar sign to possible parens to manipulate with evil-surround
;; ;; (from https://github.com/emacs-evil/evil-surround/issues/141)
;; ;; (Not sure it's working...)
;; (defmacro define-and-bind-quoted-text-object (name key start-regex end-regex)
;;   (let ((inner-name (make-symbol (concat "evil-inner-" name)))
;;         (outer-name (make-symbol (concat "evil-a-" name))))
;;     `(progn
;;        (evil-define-text-object ,inner-name (count &optional beg end type)
;;          (evil-select-paren ,start-regex ,end-regex beg end type count nil))
;;        (evil-define-text-object ,outer-name (count &optional beg end type)
;;          (evil-select-paren ,start-regex ,end-regex beg end type count t))
;;        (define-key evil-inner-text-objects-map ,key #',inner-name)
;;        (define-key evil-outer-text-objects-map ,key #',outer-name))))

;; (define-and-bind-quoted-text-object "pipe" "|" "|" "|")
;; (define-and-bind-quoted-text-object "slash" "/" "/" "/")
;; (define-and-bind-quoted-text-object "asterisk" "*" "*" "*")
;; (define-and-bind-quoted-text-object "dollar" "$" "\\$" "\\$") ;; sometimes your have to escape the regex

;;   (define-and-bind-quoted-text-object "pipe" "|" "|" "|") ; just for sake of example
;;   (define-and-bind-quoted-text-object "slash" "/" "/" "/") ; just for the sake of example
;;   (define-and-bind-quoted-text-object "dollar" "$" "\\$" "\\$") ; this is the object you want


;; Midnight mode automatically on for leuven-dark theme
(defun fsimoes-pdf-if-dark-theme-then-midnight ()
 ;; (if (member 'doom-acario-dark custom-enabled-themes)
 (if (member 'leuven-dark custom-enabled-themes)
     (funcall
      (lambda ()
        (pdf-view-midnight-minor-mode t)
        ;; (message "Set midnight mode on because current theme is doom-acario-dark")
        (message "Set midnight mode on because current theme is leuven-dark")
        )
      )
   )
)
(add-hook 'pdf-view-mode-hook #'fsimoes-pdf-if-dark-theme-then-midnight)

;; Pure black and white for pdf midnight mode
(defun fsimoes-pdf-midnight-mode-pure-black-and-white ()
        (funcall
           (lambda ()
             (setq pdf-view-midnight-colors '("#ffffff" . "#000000")) ;; Set to pure black and white
           )
        )
)
(add-hook 'pdf-view-mode-hook #'fsimoes-pdf-midnight-mode-pure-black-and-white)


;; ;; pdf keeps highlight after jumping through search results
;; (defun fsimoes-isearch-repeat-forward ()
;;   (interactive "@")
;;   (isearch-repeat-forward)
;;   ...



(require 'fzf)
(defun fsimoes-fzf-home ()
  "Starts a fzf session."
  (interactive)
  (let ((d "/home/fsimoes"))
  (fzf/start d #'fzf/action-find-file)
))

;; Keybind the above function
(map!
 :desc "Start fuzzy finder in home directory"
 :leader
 :n "o z" #'fsimoes-fzf-home)

;;;;; TO SCROLL OTHER WINDOW COMPATIBLE WITH PDFS: from https://gist.github.com/politza/3f46785742e6e12ba0d1a849f853d0b9#file-scroll-other-window-el
;;; sow.el --- Variable commands for scrolling the other window.

;; Copyright (C) 2016  Andreas Politz

;; Author: Andreas Politz <politza@fh-trier.de>
;; Keywords: extensions, frames

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:


(defvar-local sow-scroll-up-command nil)

(defvar-local sow-scroll-down-command nil)

(defvar sow-mode-map
  (let ((km (make-sparse-keymap)))
    (define-key km [remap scroll-other-window] 'sow-scroll-other-window)
    (define-key km [remap scroll-other-window-down] 'sow-scroll-other-window-down)
    km)
  "Keymap used for `sow-mode'")

(define-minor-mode sow-mode
  "FIXME: Not documented."
  nil nil nil
  :global t)

(defun sow-scroll-other-window (&optional arg)
  (interactive "P")
  (sow--scroll-other-window-1 arg))

(defun sow-scroll-other-window-down (&optional arg)
  (interactive "P")
  (sow--scroll-other-window-1 arg t))

(defun sow--scroll-other-window-1 (n &optional down-p)
  (let* ((win (other-window-for-scrolling))
         (cmd (with-current-buffer (window-buffer win)
		(if down-p
		    (or sow-scroll-down-command #'scroll-up-command)
		  (or sow-scroll-up-command #'scroll-down-command)))))
    (with-current-buffer (window-buffer win)
      (save-excursion
        (goto-char (window-point win))
        (with-selected-window win
          (funcall cmd n))
        (set-window-point win (point))))))

(add-hook 'Info-mode-hook
	  (lambda nil
	    (setq sow-scroll-up-command
		  (lambda (_) (Info-scroll-up))
		  sow-scroll-down-command
		  (lambda (_) (Info-scroll-down)))))

(add-hook 'doc-view-mode-hook
          (lambda nil
            (setq sow-scroll-up-command
                  'doc-view-scroll-up-or-next-page
                  sow-scroll-down-command
                  'doc-view-scroll-down-or-previous-page)))

(add-hook 'pdf-view-mode-hook
          (lambda nil
            (setq sow-scroll-up-command
                  'pdf-view-scroll-down-or-previous-page
                  ;; 'pdf-view-scroll-up-or-next-page
                  sow-scroll-down-command
                  'pdf-view-scroll-up-or-next-page)))
                  ;; 'pdf-view-scroll-down-or-previous-page)))

(provide 'scroll-other-window)
;;; scroll-other-window.el ends here


;; Keybind the above functions
(map!
 :g "C-M-j" #'sow-scroll-other-window-down)

(map!
 :g "C-M-k" #'sow-scroll-other-window)


;; Save agenda when saving session [suggested by chatgpt, but desktop-globals-to-save is undefined...]
;; (add-to-list 'desktop-globals-to-save 'org-agenda-files)
;; Save pdf scale when saving session
;; (add-to-list 'desktop-globals-to-save 'pdf-view-mode-text-scale)


;; Caps lock notice
;; (require 'dash)
;; (require 's)

;; (defun x-led-mask ()
;;   "Get the current status of the LED mask from X."
;;   (with-temp-buffer
;;     (call-process "xset" nil t nil "q")
;;     (let ((led-mask-string
;;            (->> (buffer-string)
;;                 s-lines
;;                 (--first (s-contains? "LED mask" it))
;;                 s-split-words
;;                 -last-item)))
;;       (string-to-number led-mask-string 16))))

;; (defun caps-lock-on (led-mask)
;;   "Return non-nil if caps lock is on."
;;   (eq (logand led-mask 1) 1))

;; (define-minor-mode caps-lock-show-mode
;;   "Display whether caps lock is on."
;;   :global t
;;   :lighter (:eval (if (caps-lock-on (x-led-mask)) " CAPS-LOCK" "")))


;; Define list of repos to check with Magit at once
(setq magit-repository-directories '(("/home/fsimoes/Documents/MyArticles/" . 0)
                                     ("/home/fsimoes/Documents/Presentations/" . 0)
                                     ("/home/fsimoes/Documents/Notes/" . 0)
                                     ("/home/fsimoes/Documents/Personal/francisco-simoes.github.io/" . 0)
                                     ("/home/fsimoes/.doom.d/" . 0)
                                     ("/home/fsimoes/.emacs.d/" . 0)
                                     ("/home/fsimoes/.oh-my-zsh/" . 0)
                                     ))

;; ; Magit repo list will also have a column with the status of the repo
;; (add-to-list 'magit-repolist-columns
;;              '("Status" 10 magit-repolist-column-flag) t )
