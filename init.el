 ;; MELPA
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-initialize)

;;MacOsx keyboard config. Comment in Windows / Linux
(setq default-input-method "MacOSX")
;;(setq mac-option-key-is-meta t)
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-right-option-modifier nil)
(setq x-select-enable-clipboard t)
(setq mac-pass-command-to-system t)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; Visual Bell - Avoid Beep
(setq visible-bell t)

;; Tema
;;;;;;;;;;;;;;;
(load-theme 'tango-dark)
(load-theme 'monokai t) ;;t for avoid confirmation

;; Word Wrap
(global-visual-line-mode 1)

;; linum-mode -> Line numbers
(linum-mode 1)

;; markdown-mode
;;;;;;;;;;;;;;;;
(add-hook 'markdown-mode-hook
        (lambda ()
            (when buffer-file-name
              (add-hook 'after-save-hook
                        'check-parens
                        nil t))))


;;Markdown-mode comillas
(add-hook 'markdown-mode-hook (lambda () (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table)))

;;pandoc-mode
;;;;;;;;;;;;;;
(add-hook 'markdown-mode-hook 'pandoc-mode)

;;ido-vertical-mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)


;; Keybinds
;;;;;;;;;;;

(global-set-key (kbd "C-<SPC>") 'set-mark-command) ; Ctrl-SPC Set Mark

;; (global-set-key (kbd "C-k") 'kill-whole-line) ;jj Ctrl-K Kill

;; (global-set-key (kbd "C-<tab>") 'other-window) ; Ctrl-TAB Next Window Buffer

(global-set-key (kbd "C-q") 'save-buffers-kill-emacs) ; Ctrl-Q Quit

;; (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward) ; -> Search Forward
;; (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward) ; <- Search Backward

(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-z") 'undo) ; Ctrl-Z Undo
(global-set-key (kbd "C-S-Z") 'redo) ; Ctrl-Shift-Z Redo

;; (global-set-key (kbd "C-'") 'comment-dwim) ; Ctrl-ç Comment

(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)

;; Set super-h and Alt-h to hide window
;; (global-set-key [(meta h)] 'ns-do-hide-emacs)
;; (global-set-key [(super h)] 'ns-do-hide-emacs)
(global-set-key (kbd "S-h") 'ns-do-hide-emacs)
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)

;; redo+
(require 'redo+)

;; dirtree
(require 'dirtree)

;; linum-mode
(global-linum-mode t)

;; lorem-ipsum
(require 'lorem-ipsum)

;; Yasnippet
;;(add-to-list 'load-path "~/.emacs.d/snippets")
(require 'yasnippet) ;; not yasnippet-bundle
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/"
        ))
(yas-global-mode 1)

(require 'emmet-mode) ;; C-j expand emmet snippets
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil


;; smartparens
(package-initialize)
(smartparens-global-mode t)
(require 'smartparens-config)
;; evil-smartparens will be enabled whenever smartparens is enabled
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

;; haml-mode
(require 'haml-mode)

;;tabuladores... No se si funciona
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 5 120 5))

;;auctex
;;;;;;;;
(load "auctex.el" nil t t)
(setq TeX-PDF-mode t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(delete-selection-mode t)
 '(evil-space-mode t)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys t)
 '(package-selected-packages
   (quote
    (rainbow-delimiters projectile cider clojure-mode linum-relative evil-space evil-smartparens emmet-mode yasnippet-bundle evil-matchit monokai-theme pandoc-mode evil-nerd-commenter powerline-evil evil-avy evil-easymotion evil-leader powerline neotree yasnippet smex smartparens redo+ markdown-mode+ lorem-ipsum key-chord ido-vertical-mode haml-mode evil-surround dirtree company coffee-mode auctex)))
 '(recentf-mode t)
 '(shift-select-mode nil)
 '(show-paren-mode t))


;; coffeescript
(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
     (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))

;; clojure
(require 'clojure-mode)

;;Rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 160 :width normal)))))

(set-face-attribute 'default nil :font  "Menlo-16" )
(set-frame-font   "Menlo-16" nil t)


(setq shift-select-mode t)
;; For auto-completion
(add-hook 'after-init-hook 'global-company-mode)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'key-chord)
(setq key-chord-two-keys-delay 0.15)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-normal-state-map "ZZ" 'evil-save-and-close)
(key-chord-mode 1)

(define-key evil-normal-state-map (kbd "U") 'redo) ;U is also redo in evil-mode

;;; evil <esc> quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; ,. -> <esc>
;; (key-chord-define evil-normal-state-map ",," 'evil-force-normal-state)
(key-chord-define evil-visual-state-map ",." 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map ",." 'evil-normal-state)
(key-chord-define evil-replace-state-map ",." 'evil-normal-state)
;; (key-chord-define evil-visual-state-map ",." 'keyboard-quit)
(key-chord-define minibuffer-local-map ",." 'minibuffer-keyboard-quit)
(key-chord-define minibuffer-local-ns-map ",." 'minibuffer-keyboard-quit)
(key-chord-define minibuffer-local-completion-map ",." 'minibuffer-keyboard-quit)
(key-chord-define minibuffer-local-must-match-map ",." 'minibuffer-keyboard-quit)
(key-chord-define minibuffer-local-isearch-map ",." 'minibuffer-keyboard-quit)

;;neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(require 'powerline)
(require 'powerline-evil)
(powerline-evil-vim-color-theme)

;; evil-nerd-commenter
(evilnc-default-hotkeys)

;;extend % use to tags
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; evil-space: Repeat search with <SPC> and <S-SPC>
(require 'evil-space)
(evil-space-mode)

;; avy = easymotion
(require 'avy)

;; set custom evil-leader keybinds
(evil-leader/set-key
  ",f" 'avy-goto-char
  ",F" 'avy-goto-char
  ",t" 'avy-goto-char
  ",T" 'avy-goto-char
  ",w" 'avy-goto-word-0-below
  ",b" 'avy-goto-word-0-above
  ",j" 'avy-goto-line-below
  ",k" 'avy-goto-line-above
  "s"  'evil-search-forward
  "S"  'evil-search-backward
  "rr" 'eval-buffer
  "f"  'ido-find-file
  "t"  'ido-find-file
  "e"  'ido-find-file
  "p"  'ido-find-file
  "b"  'switch-to-buffer
  "w"  'save-buffer
  "q"  'kill-buffer
  ",q" 'kill-emacs ;q!
  "zz" 'save-buffers-kill-emacs
  "max" 'toggle-frame-maximized
  "min" 'toggle-frame-maximized
  "mf" 'toggle-frame-fullscreen
  "v" 'visual-line-mode ;;'toggle-word-wrap
  "n" '(lambda ()(interactive) (linum-mode) (linum-relative-toggle))
  "x" 'smex
  "."  'evil-ex
  )

