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
;; (setq pdf-latex-command "latexmk -shell-escape -bibtex -f -pdf %f")


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

;; ::::::::::::::::::::::::::::::::
;; LSP IDE
;; ::::::::::::::::::::::::::::::::
; Use flake8 instead of pycodestyle for linting
(setq lsp-pyls-configuration-sources ["flake8"])
; Flychecker will take care of typing linting
;; (add-to-list 'flycheck-checkers 'python-mypy t)

;; ;; Python linting
;; (add-hook! 'lsp-mode-hook
;;         (flycheck-select-checker 'python-flake8)
;;         (flycheck-add-next-checker 'python-flake8 'python-mypy)
;;         ;; (flycheck-add-next-checker 'lsp '(warning . python-mypy))
;;         ;; (flycheck-add-next-checker 'lsp '(warning . python-flake8))
;; )

;; Format with black on save
(add-hook! 'python-mode-hook
           (python-black-on-save-mode t)
)

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
;; (setq-default flycheck-disabled-checkers '(python-pylint))

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
;; (setq org-log-done 'time)
;; Closed todo's without timestamp:
(setq org-log-done nil)

;; Set todo keywods
;; (The `!` after INPROGRESS enforces the creation of a time-stamp.)
;; (The `@` after WAITING enforces the creation of a note.)
(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i!)" "WAITING(w@)" "IDEA(I)" "QUESTION(q)" "|" "DONE(d)" "CANCELLED(c)" "POSTPONED(P)" "ANSWER(a)" "PARTIAL(p)")))
        (setq org-todo-keyword-faces
        '(("TODO" :foreground "orange" :weight bold)
                ("INPROGRESS" :foreground "dark magenta" :weight bold)
                ("WAITING" :foreground "purple" :weight bold)
                ("IDEA" :foreground "gold" :weight normal)
                ("QUESTION" :foreground "dark goldenrod" :weight normal)
                ("DONE"  :foreground "olive drab" :weight normal)
                ("CANCELLED" :foreground "firebrick" :weight normal)
                ("POSTPONED" :foreground "dark olive green" :weight normal)
                ("ANSWER" :foreground "tomato" :weight normal)
                ("PARTIAL" :foreground "dark olive green" :weight normal)))
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
;; Undo
;; evil registers actions using emacs heuristics instead of at normal state activation
(setq evil-want-fine-undo t)
;; activate undo-in-region for undo-fu
;; (sacrificing some undo/redo functionality)
(setq undo-fu-allow-undo-in-region t)
;; C-g does not enable non-linear behaviour for undo-fu.
;; (instead, one must use undo-fu-disable-checkpoint)
(setq undo-fu-ignore-keyboard-quit t)

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
(load-theme 'doom-one t)
(setq doom-challenger-deep-brighter-comments t)

;; Change directory to save the "desktops" in
(setq desktop-dirname "/home/fsimoes/.doom.d/desktop_save")
;; Make it save automatically
;; (desktop-save-mode 1)

;; ===================================
;; Custom keybindings
;; ===================================
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

;; Send python current line to REPL
;; (defun python-shell-send-line ()
;;   "Execute current line in the REPL"
;;   (interactive)
;;   (evil-visual-line)
;;   (python-shell-send-region)
;;   (evil-normal-state))

(setq flycheck-flake8rc "~/.config/flake8")

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
(setq ispell-personal-dictionary nil)


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
                                       "~/Documents/Library/GameTheory"
                                       "~/Documents/Library/ML"
                                       "~/Documents/Library/Stats"
                                       "~/Documents/Library/Probability"))
;; One notes file per publication
(setq bibtex-completion-notes-path "~/Documents/Notes/LibraryNotes")

;; Get org-ref to play nice with ivy-bibtex (from https://github.com/jkitchin/org-ref#configuration)
(require 'org-ref-ivy)
(setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
      org-ref-insert-cite-function 'org-ref-cite-insert-ivy
      org-ref-insert-label-function 'org-ref-insert-label-link
      org-ref-insert-ref-function 'org-ref-insert-ref-link
      org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))

;; Org roam https://www.youtube.com/watch?v=rH3ZH95zjKM
(setq org-roam-directory "~/Documents/Notes/Roam")

;; Save notes from org-noter in the same directory as bibtex-completion
;; (setq org-noter?????? "~/Documents/Notes/LibraryNotes")

;; Latex fragments across entire buffer
(defun fsimoes-org-latex-preview-buffer ()
  (interactive "@")
  (org-latex-preview '(16)))

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
