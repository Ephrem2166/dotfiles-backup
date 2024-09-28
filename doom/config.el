(setq user-full-name "Ephrem G"
      user-mail-address "ephrem2181@gmail.com")

(use-package doom-themes
  :custom-face
  (font-lock-comment-face ((t (:slant italic))))
  (font-lock-string-face ((t (:foreground "PeachPuff3"))))
  (font-lock-function-name-face ((t (:foreground "LightGoldenrod"))))
  (highlight ((t (:underline t :background nil :foreground nil))))
  (lazy-highlight ((t (:background nil :foreground nil :box (:line-width -1)))))
  (fixed-pitch ((t (:family "Noto Sans Mono"))))
  :config
  (load-theme 'doom-nord t)
  (defconst ef/cursor-color (if (daemonp) "#D08770" (face-background 'cursor)))
  (defconst ef/font-color (if (daemonp) "#C0C5CE" (face-foreground 'default)))
  (defconst ef/background-color (if (daemonp) "#2B303B" (face-background 'default)))
  (defconst ef/dark-color (doom-darken ef/background-color 0.15))
  (defconst ef/dark-color1 (doom-darken ef/background-color 0.01))
  (defconst ef/dark-color2 (doom-darken ef/background-color 0.02))
  (defconst ef/dark-color3 (doom-darken ef/background-color 0.03))
  (defconst ef/dark-color4 (doom-darken ef/background-color 0.04))
  (defconst ef/dark-color5 (doom-darken ef/background-color 0.05))
  (defconst ef/dark-color6 (doom-darken ef/background-color 0.06))
  (defconst ef/dark-color7 (doom-darken ef/background-color 0.07))
  (defconst ef/dark-color8 (doom-darken ef/background-color 0.08))
  (defconst ef/dark-color9 (doom-darken ef/background-color 0.09))
  (defconst ef/light-color (doom-lighten ef/background-color 0.15))
  (defconst ef/light-color1 (doom-lighten ef/background-color 0.09))
  (defconst ef/light-color2 (doom-lighten ef/background-color 0.08))
  (defconst ef/light-color3 (doom-lighten ef/background-color 0.07))
  (defconst ef/light-color4 (doom-lighten ef/background-color 0.06))
  (defconst ef/light-color5 (doom-lighten ef/background-color 0.05))
  (defconst ef/light-color6 (doom-lighten ef/background-color 0.04))
  (defconst ef/light-color7 (doom-lighten ef/background-color 0.03))
  (defconst ef/light-color8 (doom-lighten ef/background-color 0.02))
  (defconst ef/light-color9 (doom-lighten ef/background-color 0.01)))

(setq gc-cons-threshold 134217738
      gc-cons-percentage 0.1
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      vc-follow-symlinks t
      native-comp-async-report-warnings-errors nil
      load-prefer-newer t)
(set-language-environment "UTF-8")
(set-locale-environment "en_US.UTF-8")
(set-selection-coding-system 'utf-8-unix)
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(global-set-key (kbd "C-<wheel-up>") 'text-scale-increase)
(global-set-key (kbd "C-<wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(delete-selection-mode t)
(setq ranger-show-hidden t)
(setq scroll-conservatively 101
      battery-update-interval 2
      focus-follows-mouse t
      mouse-wheel-scroll-amount '(2 ((shift) . 2))
      mouse-wheel-progressive-speed t
      mouse-wheel-follow-mouse 't
      display-line-numbers-type t
      scroll-step 1
      scroll-margin 2
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      hscroll-step 1
      hscroll-margin 1
      writeroom-width 100
      writeroom-mode-line t
      writeroom-extra-line-spacing 0.1
      writeroom-maximize-window t
      +zen-text-scale 1)
(setq fancy-battery-show-percentage t)
(setq evil-vsplit-window-right t
      evil-split-window-below t)

(add-hook! 'minibuffer-setup-hook 'garbage-collect)
(add-hook! '+popup-mode-hook (hide-mode-line-mode 1))
(add-hook! '+popup-mode-hook 'garbage-collect)

  ;; Frame Font
  (set-frame-font "UbuntuMono Nerd Font  10")
  ;; Default Font
  (set-face-attribute 'default nil :font "UbuntuMono Nerd Font 10")
  ;; Fixed Font
  (set-face-attribute 'fixed-pitch nil :font "UbuntuMono Nerd Font 10")
  ;; Variable Font
  (set-face-attribute 'variable-pitch nil :font "UbuntuMono Nerd Font 10" :weight 'regular)

(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)

(use-package emacs
  :ensure nil
  :demand t
  :config
  (setq tab-always-indent 'complete)
  (setq tab-first-completion 'word-or-paren-or-punct) ; Emacs 27
  (setq-default tab-width 4
                indent-tabs-mode nil))

;;;; Parentheses (show-paren-mode)
(use-package paren
  :ensure nil
  :hook (prog-mode . show-paren-local-mode)
  :config
  (setq show-paren-style 'parenthesis)
  (setq show-paren-when-point-in-periphery nil)
  (setq show-paren-when-point-inside-paren nil)
  (setq show-paren-context-when-offscreen 'overlay))

(map! :leader
      (:prefix ("e". "evaluate")
       :desc "Evaluate elisp in buffer"  "b" #'eval-buffer
       :desc "Evaluate defun"            "d" #'eval-defun
       :desc "Evaluate elisp expression" "e" #'eval-expression
       :desc "Evaluate last sexpression" "l" #'eval-last-sexp
       :desc "Evaluate elisp in region"  "r" #'eval-region))

;;;; Auto revert mode
(use-package! autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode)
  :config
  (setq auto-revert-verbose t))

(beacon-mode 1)

;;;; Delete selection
(use-package! delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(use-package denote
  :ensure t
  :hook
  ;; If you use Markdown or plain text files you want to buttonise
  ;; existing buttons upon visiting the file (Org renders links as
  ;; buttons right away).
  ;;((find-file . denote-link-buttonize-buffer)
  ((text-mode . denote-fontify-links-mode-maybe)
   ;; Highlight Denote file names in Dired buffers.  Below is the
   ;; generic approach, which is great if you rename files Denote-style
   ;; in lots of places as I do.
   ;;
   ;; If you only want the `denote-dired-mode' in select directories,
   ;; then modify the variable `denote-dired-directories' and use the
   ;; following instead:
   ;;
   ;;  (dired-mode . denote-dired-mode-in-directories)
   (dired-mode . denote-dired-mode))
  :bind
  ;; Denote DOES NOT define any key bindings.  This is for the user to
  ;; decide.  For example:
  ( :map global-map
    ("C-c n n" . denote)
    ("C-c n N" . denote-type)
    ("C-c n d" . denote-date)
    ("C-c n z" . denote-signature) ; "zettelkasten" mnemonic
    ("C-c n s" . denote-subdirectory)
    ("C-c n o" . denote-sort-dired) ; "order" mnemonic
    ("C-c n j" . denote-journal-extras-new-entry)
    ("C-c n J" . denote-journal-extras-new-or-existing-entry)
    ;; Note that `denote-rename-file' can work from any context, not
    ;; just Dired buffers.  That is why we bind it here to the
    ;; `global-map'.
    ;;
    ;; Also see `denote-rename-file-using-front-matter' further below.
    ("C-c n r" . denote-rename-file)

    ;; If you intend to use Denote with a variety of file types, it is
    ;; easier to bind the link-related commands to the `global-map', as
    ;; shown here.  Otherwise follow the same pattern for
    ;; `org-mode-map', `markdown-mode-map', and/or `text-mode-map'.
    :map text-mode-map
    ("C-c n i" . denote-link) ; "insert" mnemonic
    ("C-c n I" . denote-add-links)
    ("C-c n b" . denote-backlinks)
    ("C-c n f f" . denote-find-link)
    ("C-c n f b" . denote-find-backlink)
    ;; Also see `denote-rename-file' further above.
    ("C-c n R" . denote-rename-file-using-front-matter)

    ;; I do not bind the Org dynamic blocks, but they are useful:
    ;;
    ;; - `denote-org-extras-dblock-insert-links'
    ;; - `denote-org-extras-dblock-insert-backlinks'
    ;; - `denote-org-extras-dblock-insert-files'
    ;; - `denote-org-extras-dblock-insert-missing-links'

    ;; Key bindings specifically for Dired.
    :map dired-mode-map
    ("C-c C-d C-i" . denote-link-dired-marked-notes)
    ("C-c C-d C-r" . denote-dired-rename-marked-files)
    ("C-c C-d C-k" . denote-dired-rename-marked-files-with-keywords)
    ("C-c C-d C-f" . denote-dired-rename-marked-files-using-front-matter))
  :config
  ;; Remember to check the doc strings of those variables.
  (setq denote-directory (expand-file-name "~/Documents/notes/"))
  (setq denote-file-type 'text) ; Org is the default, set others here like I do
  ;; If you want to have a "controlled vocabulary" of keywords,
  ;; meaning that you only use a predefined set of them, then you want
  ;; `denote-infer-keywords' to be nil and `denote-known-keywords' to
  ;; have the keywords you need.
  (setq denote-known-keywords '("emacs" "philosophy" "politics" "economics"))
  (setq denote-infer-keywords t)
  (setq denote-sort-keywords t)
  (setq denote-excluded-directories-regexp nil)
  (setq denote-date-format nil) ; read its doc string
  (setq denote-rename-no-confirm t)
  (setq denote-backlinks-show-context nil)
  (setq denote-rename-buffer-format "[D] %t")

  ;; Automatically rename Denote buffers when opening them so that
  ;; instead of their long file name they have a literal "[D]"
  ;; followed by the file's title.  Read the doc string of
  ;; `denote-rename-buffer-format' for how to modify this.
  (denote-rename-buffer-mode 1)

  (setq denote-journal-extras-directory nil) ; use the `denote-directory'
  (setq denote-journal-extras-title-format nil) ; always prompt for title
  (setq denote-journal-extras-keyword "journal")

  (with-eval-after-load 'org-capture
    (setq denote-org-capture-specifiers "%l\n%i\n%?")
    (add-to-list 'org-capture-templates
                 '("n" "New note (with denote.el)" plain
                   (file denote-last-path)
                   #'denote-org-capture
                   :no-save t
                   :immediate-finish nil
                   :kill-buffer t
                   :jump-to-captured t))

    ;; This prompts for TITLE, KEYWORDS, and SUBDIRECTORY
    (add-to-list 'org-capture-templates
                 '("N" "New note with prompts (with denote.el)" plain
                   (file denote-last-path)
                   (function
                    (lambda ()
                      (denote-org-capture-with-prompts :title :keywords :signature)))
                   :no-save t
                   :immediate-finish nil
                   :kill-buffer t
                   :jump-to-captured t))))

(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file"           "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "+") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "% l") 'dired-downcase
  (kbd "% m") 'dired-mark-files-regexp
  (kbd "% u") 'dired-upcase
  (kbd "* %") 'dired-mark-files-regexp
  (kbd "* .") 'dired-mark-extension
  (kbd "* /") 'dired-mark-directories
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(use-package! goto-chg
  :ensure t
  :bind
  (("C-(" . goto-last-change)
   ("C-)" . goto-last-change-reverse)))

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.2)))))

(use-package! markdown-mode
  :ensure t
  :defer t
  :config
  (setq markdown-fontify-code-blocks-natively t))

;;;; `man' (manpages)
(use-package! man
  :ensure nil
  :commands (man)
  :config
  (setq Man-notify-method 'pushy)) ; does not obey `display-buffer-alist'

(use-package org
  :ensure nil
  :config
  (setq org-directory (expand-file-name "~/Documents/Notes/Org/"))

;; GENERAL SETTINGS

   (setq ;; org-export-in-background t
   org-src-preserve-indentation t ;; do not put two spaces on the left
   org-startup-indented t
   ;; org-startup-with-inline-images t
   ;;org-hide-emphasis-markers t
   org-catch-invisible-edits 'smart)
  (setq org-image-actual-width nil)
  (setq org-indent-indentation-per-level 1)
  (setq org-list-demote-modify-bullet '(("-" . "+") ("+" . "*")))

  ;; disable modules for faster startup
  (setq org-modules
        '(ol-docview
          org-habit))

  ;; edit settings
  (setq org-auto-align-tags nil
        org-tags-column 0
        org-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t ;; special navigation behaviour in headlines
        org-insert-heading-respect-content t)

  ;; styling, hide markup, etc.
  (setq org-hide-emphasis-markers t
	org-fontify-done-headline t
	org-ellipsis " ▾"
	;; org-ellipsis "…"
	org-fontify-quote-and-verse-blocks t
	org-fontify-whole-heading-line t
	org-hidden-keywords nil
	org-hide-leading-stars t
	org-startup-folded t
	org-startup-indented nil
	org-startup-with-inline-images nil
	org-startup-with-latex-preview nil
	org-highlight-latex-and-related '(native)
	org-indent-mode-turns-on-hiding-stars nil
	org-pretty-entities-include-sub-superscripts t
	org-use-sub-superscripts '{}
	org-pretty-entities nil
	org-image-align 'center
        org-src-fontify-natively t ;; fontify source blocks natively
        ;;org-highlight-latex-and-related '(native) ;; fontify latex blocks natively
        ;;org-pretty-entities t
	)
(setq org-structure-template-alist
        '(("s" . "src")
          ("e" . "src emacs-lisp")
          ("E" . "src emacs-lisp :results value code :lexical t")
          ("t" . "src emacs-lisp :tangle FILENAME")
          ("T" . "src emacs-lisp :tangle FILENAME :mkdirp yes")
          ("x" . "example")
          ("X" . "export")
          ("q" . "quote")))

  (setq org-adapt-indentation nil) ;; interacts poorly with 'evil-open-below'


  (setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "»")
                                         ("#+END_SRC" . "«")
                                         ("#+begin_src" . "»")
                                         ("#+end_src" . "«")
                                         ("lambda"  . "λ")
                                         ("->" . "→")
                                         ("->>" . "↠")))

  (setq prettify-symbols-unprettify-at-point 'right-edge)


  :general
  (ef/local-leader-keys
    :keymaps 'org-mode-map
    "a" '(org-archive-subtree :wk "archive")
    "l" '(:ignore t :wk "link")
    "ll" '(org-insert-link t :wk "link")
    "lp" '(org-latex-preview t :wk "prev latex")
    "h" '(consult-org-heading :wk "consult heading")
    "d" '(org-cut-special :wk "org cut special")
    "y" '(org-copy-special :wk "org copy special")
    "p" '(org-paste-special :wk "org paste special")
    "b" '(:keymap org-babel-map :wk "babel")
    "t" '(org-todo :wk "todo")
    "s" '(org-insert-structure-template :wk "template")
    "e" '(org-edit-special :wk "edit")
    "i" '(:ignore t :wk "insert")
    "ih" '(org-insert-heading :wk "insert heading")
    "is" '(org-insert-subheading :wk "insert heading")
    "f" '(org-footnote-action :wk "footnote action")
    ">" '(org-demote-subtree :wk "demote subtree")
    "<" '(org-promote-subtree :wk "demote subtree"))

  :hook (
	 (org-mode . prettify-symbols-mode)
	 (org-mode . visual-line-mode)
	 (org-mode . olivetti-mode)
	 (org-mode . variable-pitch-mode)
	 (org-mode . (lambda () (electric-indent-local-mode -1))) ;;
	 )
)

;; fold
;;(use-package org-fold
;;    :after org
;;    :config
;;    (setq org-fold-core-style 'text-properties)
;;    (setf (alist-get 'agenda org-fold-show-context-detail)
;;          'ancestors))



;;;; tags
(use-package org
  :ensure nil
  :config
  (setq org-tag-alist nil)
  (setq org-auto-align-tags nil)
  (setq org-tags-column 0))


;;;; log
(use-package org
  :ensure nil
  :config
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-log-note-clock-out nil)
  (setq org-log-redeadline 'time)
  (setq org-log-reschedule 'time))

;;;; links
(use-package org
  :ensure nil
  :config
 ;; (require 'prot-org) ; for the above commands

  (setq org-link-context-for-files t)
  (setq org-link-keep-stored-after-insertion nil)
  (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))

;;;; code blocks
(use-package org
  :ensure nil
  :config
  (setq org-confirm-babel-evaluate nil)
  (setq org-src-window-setup 'current-window)
  (setq org-edit-src-persistent-message nil)
  (setq org-src-fontify-natively t)
  (setq org-src-preserve-indentation t)
  (setq org-src-tab-acts-natively t)
  (setq org-edit-src-content-indentation 0))

;;;; export
(use-package org
  :ensure nil
  :init
  ;; NOTE 2023-05-20: Must be evaluated before Org is loaded,
  ;; otherwise we have to use the Custom UI.  No thanks!
  (setq org-export-backends '(html texinfo md))
  :config
  (setq org-export-with-toc t)
  (setq org-export-headline-levels 8)
  (setq org-export-dispatch-use-expert-ui nil)
  (setq org-html-htmlize-output-type nil)
  (setq org-html-head-include-default-style nil)
  (setq org-html-head-include-scripts nil)):

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(use-package org
  :ensure nil
  :config
  (setq org-refile-targets
        '((org-agenda-files . (:maxlevel . 2))
          (nil . (:maxlevel . 2))))
  (setq org-refile-use-outline-path t)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-refile-use-cache t)
  (setq org-reverse-note-order nil)
  ;; ;; NOTE 2023-04-07: Leaving this here for demo purposes.
  ;; (setq org-todo-keywords
  ;;       '((sequence "TODO(t)" "MAYBE(m)" "WAIT(w@/!)" "|" "CANCEL(c@)" "DONE(d!)")
  ;;         (sequence "COACH(k)" "|" "COACHED(K!)")))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "CANCEL(c@)" "DONE(d!)")
          (sequence "COACH(k)" "|" "COACHED(K!)")))
  (setq org-todo-keyword-faces
   '(("TODO" :foreground "orangered2" :weight bold)
     ("WAIT" :foreground "goldenrod" :weight bold)
     ("HOLD" :foreground "#DC752F" :weight bold)
     ("STRT" :foreground "PaleGreen" :weight bold)
     ("WIP." :foreground "#86DC2F" :weight bold)
     ("REPT" :foreground "#939DA4" :weight bold)
     ("STAG" :foreground "DarkTurquoise" :weight bold)
     ("PROD" :foreground "DodgerBlue" :weight bold)))


  (setq org-use-fast-todo-selection 'expert)

  (setq org-fontify-done-headline nil)
  (setq org-fontify-todo-headline nil)
  (setq org-fontify-whole-heading-line nil)
  (setq org-enforce-todo-dependencies t)
  (setq org-enforce-todo-checkbox-dependencies t))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :init
  (setq org-superstar-headline-bullets-list '("✖" "✚" "◉" "○" "▶")
        ;; org-superstar-special-todo-items t
        org-ellipsis " ↴ ")
  )

(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package htmlize)

(use-package org-transclusion
  :after org
  :general
  (ef/leader-keys
    "nt" '(org-transclusion-mode :wk "transclusion mode")))

(use-package org-cliplink
  :after org
  :general
  (ef/local-leader-keys
    :keymaps 'org-mode-map
    "lc" '(org-cliplink :wk "cliplink")))

(use-package org-modern
  :after org
  :config
  (global-org-modern-mode)
  :hook ((org-modern-mode . ef/org-modern-spacing))
  :config
  (defun ef/org-modern-spacing()
(setq-local line-spacing
(if org-modern-modern
0.1 0.0)))
 (setq
   ;; Edit setting
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

  org-modern-block-fringe 10
   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"
   org-modern-todo nil
   org-modern-hide-stars nil
   org-modern-horizontal-rule nil
   org-modern-keyword "‣ "
;; org-modern-block-fringe 0
   org-modern-table ni
)
)

(use-package org-noter
  :ensure nil
  :defer
  :config
  (setq org-noter-always-create-frame nil
        org-noter-kill-frame-at-session-end nil))

(eval-after-load 'org-indent '(diminish 'org-indent-mode))

  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
   '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
   '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

(require 'org-tempo)

(setq org-src-preserve-indentation t)

;;;; Rainbow mode for colour previewing (rainbow-mode.el)
(use-package! rainbow-mode
  :ensure t
  :init
  (setq rainbow-ansi-colors nil)
  (setq rainbow-x-colors nil)

  (defun ef/rainbow-mode-in-themes ()
    (when-let ((file (buffer-file-name))
               ((derived-mode-p 'emacs-lisp-mode))
               ((string-match-p "-theme" file)))
      (rainbow-mode 1)))
  :bind ( :map ctl-x-x-map
          ("c" . rainbow-mode)) ; C-x x c
  :hook (emacs-lisp-mode . ef/rainbow-mode-in-themes))

;;;; Increase padding of windows/frames
;; Yet another one of my packages:
;; <https://protesilaos.com/codelog/2023-06-03-emacs-spacious-padding/>.
(use-package spacious-padding
  :ensure t
  :if (display-graphic-p)
  :hook (after-init . spacious-padding-mode)
  :bind ("<f8>" . spacious-padding-mode)
  :init
  ;; These are the defaults, but I keep it here for visiibility.
  (setq spacious-padding-widths
        '( :internal-border-width 15
           :header-line-width 4
           :mode-line-width 6
           :tab-width 4
           :right-divider-width 1
           :scroll-bar-width 8
           :left-fringe-width 20
           :right-fringe-width 20))
)

(use-package so-long
  :ensure nil
  :hook (after-init . global-so-long-mode))

(use-package! toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(use-package! tldr)
