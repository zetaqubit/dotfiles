;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     (c-c++ :variables c-c++-enable-clang-support t)
     (command-log)
     ;; (syntax-checking :variables syntax-checking-enable-by-default nil)
     emacs-lisp
     git
     ;; markdown
     ;; org
     ranger
     ;; semantic
     (shell :variables
           shell-default-shell 'ansi-term
           shell-default-position 'bottom)
     ;;        shell-default-height 30
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
     ;; Disable evil-surround, which conflicts with the s-key needed for movement.
     evil-surround
   )

   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         monokai
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Monospace"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key nil
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ";"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."

  (setq-default
   evil-want-fine-undo nil
   dotspacemacs-themes '(spacemacs-dark monokai)
   dotspacemacs-mode-line-unicode-symbols nil
  ))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (setq-default
   ;; Disable rounding to increment of tabs.
   evil-shift-round nil
  )

  ;; Use smooth-scrolling
  (setq scroll-conservatively 10000
        scroll-margin 5)

  ;; Always follow symlinks when opening files.
  (setq vc-follow-symlinks t)

  ;; Increase scrollback in term
  (setq term-buffer-maximum-size 1000000)

  ;; Have Avy (SPC SPC character jump) use Dvorak homerow
  (setq avy-keys '(?h ?t ?n ?s ?a ?o ?e ?u ?i ?d ?p ?g ?c ?r ?k ?l ?b ?m ?w ?v ?z))

  ;;; C-c as general purpose escape key sequence.
  (defun my-esc (prompt)
    "Functionality for escaping generally.  Includes exiting Evil insert state and C-g binding. "
    (cond
     ;; If we're in one of the Evil states that defines [escape] key, return [escape] so as
     ;; Key Lookup will use it.
     ((or (evil-insert-state-p) (evil-replace-state-p) (evil-hybrid-state-p)
          (evil-normal-state-p) (evil-visual-state-p) (evil-evilified-state-p)
          )
      [escape])
     ;; This is the best way I could infer for now to have C-c work during evil-read-key.
     ;; Note: As long as I return [escape] in normal-state, I don't need this.
     ;;((eq overriding-terminal-local-map evil-read-key-map) (keyboard-quit) (kbd ""))
     (t (kbd "C-g"))))
  (define-key key-translation-map (kbd "C-c") 'my-esc)
  ;; Works around the fact that Evil uses read-event directly when in operator state, which
  ;; doesn't use the key-translation-map.
  (define-key evil-operator-state-map (kbd "C-c") 'keyboard-quit)
  ;; Not sure what behavior this changes, but might as well set it, seeing the Elisp manual's
  ;; documentation of it.
  (set-quit-char "C-c")
  (define-key key-translation-map (kbd "C--") (kbd "C-c"))

  ;; remappings
  (defun define-key-normal-mode (key fn)
    "Defines a key that applies in vim-like normal modes"
    (define-key evil-normal-state-map (kbd key) fn)
    (define-key evil-visual-state-map (kbd key) fn)
    (define-key evil-motion-state-map (kbd key) fn)
    (define-key evil-evilified-state-map (kbd key) fn)
  )

  (defun define-key-insert-mode (key fn)
    "Defines a key that applies in vim-like insert modes"
    (define-key evil-insert-state-map (kbd key) fn)
    (define-key evil-hybrid-state-map (kbd key) fn)
  )

  (define-key-insert-mode "C-h" 'delete-backward-char)
  (define-key-insert-mode "C-w" 'backward-kill-word)
  ;; TODO: enable after figuring out how to exclude terminal-mode.
  ;;(define-key-insert-mode "C-t" 'next-line)
  ;;(define-key-insert-mode "C-n" 'previous-line)

  (define-key-normal-mode "SPC ;" 'helm-M-x)
  (define-key-normal-mode "SPC :" 'evilnc-comment-operator)
  (define-key-normal-mode "h" 'evil-backward-char)
  (define-key-normal-mode "t" 'evil-next-visual-line)
  (define-key-normal-mode "n" 'evil-previous-visual-line)
  (define-key-normal-mode "s" 'evil-forward-char)
  (define-key-normal-mode "H" 'back-to-indentation)
  (define-key-normal-mode "T" 'evil-scroll-down)
  (define-key-normal-mode "N" 'evil-scroll-up)
  (define-key-normal-mode "S" 'evil-end-of-line)
  (define-key-normal-mode "C-h" 'evil-window-left)
  (define-key-normal-mode "C-t" 'evil-window-down)
  (define-key-normal-mode "C-n" 'evil-window-up)
  (define-key-normal-mode "C-s" 'evil-window-right)
  (define-key-normal-mode "L" 'evil-change-whole-line)
  (define-key-normal-mode "j" 'evil-search-next)
  (define-key-normal-mode "Q" 'evil-search-previous)
  (define-key-normal-mode "k" 'evil-repeat-find-char)
  (define-key-normal-mode "K" 'evil-repeat-find-char-reverse)
  (define-key-normal-mode "C-*" 'evil-lookup)
  (define-key-normal-mode "-" 'evil-jump-backward)
  (define-key-normal-mode "_" 'evil-jump-forward)

  ;; remap "," to "<Leader>o" for quick access to user-defined maps.
  ;; (with-eval-after-load 'evil-leader
    (define-key evil-normal-state-map (kbd ",")
      (lookup-key spacemacs-cmds (kbd "o")))
      ;;(lookup-key evil-leader--default-map (kbd "SPC o")))
  ;;)

  (defun define-leader-command (key fn)
    "Maps <Leader>key to fn in normal modes"
    ;; (define-key evil-normal-state-map (kbd (concat "SPC o " key)) fn)
    (define-key evil-normal-state-map (kbd (concat ", " key)) fn)
  )

  (with-eval-after-load 'company
    ;; configs
    (global-company-mode)
    (setq company-idle-delay 0.05)
    (setq company-auto-complete 'company-explicit-action-p)
    ;; keybinds
    (define-key company-active-map (kbd "C-t") 'company-select-next)
    (define-key company-active-map (kbd "C-n") 'company-select-previous)
    (define-key company-active-map (kbd "C-d") 'company-next-page)
    (define-key company-active-map (kbd "C-u") 'company-previous-page)
    (define-key company-active-map (kbd "C-b") 'company-show-doc-buffer)
    (define-key company-active-map (kbd "C-m") 'company-show-location)
    (define-key company-active-map (kbd "C-h") 'nil)
    (define-key company-active-map (kbd "C-w") 'nil)
  )

  ;; Switch between h and cc using ,ga or ,o
  (with-eval-after-load 'projectile
    (push '("cc" "h") projectile-other-file-alist)
    (define-leader-command "o" 'projectile-find-other-file)
  )

  ;; Use emacs bindings in helm edit mode
  (with-eval-after-load 'helm
    (defun define-key-helm (key fn)
      "Defines a key that applies in vim-like insert modes"
      (define-key helm-map (kbd key) fn)
      (define-key helm-buffer-map (kbd key) fn)
      (define-key helm-generic-files-map (kbd key) fn)
    )
    (define-key-helm "C-t" 'helm-next-line)
    (define-key-helm "C-n" 'helm-previous-line)
    (define-key-helm "C-d" 'helm-next-page)
    (define-key-helm "C-u" 'helm-previous-page)
    (define-key-helm "C-w" 'backward-kill-word)

    (define-key evil-normal-state-map (kbd "SPC y") 'helm-resume)

    (define-leader-command "p" 'helm-projectile-switch-project)
    (define-leader-command "t" 'helm-projectile-find-file)
  )

  ;; Configure indent
  (setq tab-width 2)
  (defvaralias 'c-basic-offset 'tab-width)
  (setq python-indent 2)
  (setq evil-shift-width python-indent)

  ;; Search for the keymap that contains a mapping
  (defun query-keybinding ()
    (interactive)
    (message (list
     (minor-mode-key-binding (kbd "n"))
     (local-key-binding (kbd "n"))
     (global-key-binding (kbd "n"))
     ))
  )
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-leader command-log-mode s powerline parent-mode projectile request gitignore-mode flycheck pkg-info epl flx smartparens iedit anzu highlight pos-tip company yasnippet packed dash helm avy helm-core async auto-complete popup package-build bind-key bind-map evil srefactor ranger paradox hydra spinner orgit magit-gitflow helm-flx evil-magit magit magit-popup git-commit with-editor company-quickhelp xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package stickyfunc-enhance spacemacs-theme spaceline smooth-scrolling smeargle shell-pop restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el page-break-lines open-junk-file neotree multi-term move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-jumper evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu eshell-prompt-extras esh-help elisp-slime-nav disaster define-word company-statistics company-c-headers cmake-mode clean-aindent-mode clang-format buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(projectile-other-file-alist
   (quote
    (("cc" "h")
     ("cpp" "h" "hpp" "ipp")
     ("ipp" "h" "hpp" "cpp")
     ("hpp" "h" "ipp" "cpp")
     ("cxx" "h" "hxx" "ixx")
     ("ixx" "h" "hxx" "cxx")
     ("hxx" "h" "ixx" "cxx")
     ("c" "h")
     ("m" "h")
     ("mm" "h")
     ("h" "c" "cc" "cpp" "ipp" "hpp" "cxx" "ixx" "hxx" "m" "mm")
     ("cc" "hh")
     ("hh" "cc")
     ("vert" "frag")
     ("frag" "vert")
     (nil "lock" "gpg")
     ("lock" "")
     ("gpg" "")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
