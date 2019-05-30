;; Package System ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; パッケージの保存先の指定
(setq package-user-dir "~/.emacs.d/elisp/")
(package-initialize)
(setq package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")
    ;("melpa-stable" . "https://stable.melpa.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
    ("org" . "http://orgmode.org/elpa/")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Elisp ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load-path を設定
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;; 表示設定
;; スタート時のスプラッシュ非表示
(setq inhibit-startup-message t)
;; アラートのベルはうるさいので消す
(setq ring-bell-function 'ignore)
;; 表示領域を確保したいのでツールバーは非表示
(if window-system
    (tool-bar-mode 0))
;; メニューバーを非表示に
(menu-bar-mode 0)
;; line numberの表示
;;(global-linum-mode 1)
;; 対応する括弧をハイライト
(show-paren-mode 1)
;; current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
          (cdr ls))))

;; スクロールは1行ごとに ;動作してない？
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))
;; スクロールは１行ごとに
(setq scroll-conservatively 1)
;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)

;; タブにスペースを使用する
(setq-default tab-width 4
              indent-tabs-mode nil)

;;; キーバインド
;; C-h をバックスペースに当てる
(global-set-key "\C-h" 'delete-backward-char)
;; C-t をウィンドウの移動に当てる
(define-key global-map (kbd "C-t") 'other-window)
;; C-z を undo に
(define-key global-map (kbd "C-z") 'undo)
;; C-S-aをターミナル起動に当てる
(define-key global-map (kbd "C-S-a") 'ansi-term)
;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; ウィンドウを透明にする
;; アクティブウィンドウ／非アクティブウィンドウ(alphaの値で透明度を指定)
(add-to-list 'default-frame-alist '(alpha . (1.00 0.85)))

;; highlight cullent line, hl-line-mode
(defface my-hl-line-face
  '((((class color)(background dark))
     (:background "NavyBlue" t))
    (((class color)(background light))
     (:background "NavyBlue" t)) ; LightSkyBlue

    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; (set-language-environment "Japanese")
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8)

;; “「”を入力したら”」”も自動で挿入
(setq skk-auto-insert-paren t) ;動作してない？

;; 選択領域を削除キーで一括削除
(delete-selection-mode t)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; backward-kill-line
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
(define-key global-map (kbd "C-c C-u") 'backward-kill-line)

;; 見た目の変更
(setq default-frame-alist
      (append (list
               ;;; default color
               '(background-color . "black")
               '(foreground-color . "snow")
               ;;; cursor
               '(cursor-color . "snow")
               '(cursor-type . box)
               '(cursor-height . 4)
               ;;; mouse cursor
               '(mouse-color . "white")
               ;;; border
               '(border-color . "black")
               ;;; scroll bar
               '(vertical-scroll-bars . nil)
               ;;; size
               '(width . 250)  ;79
               '(height . 70)
               ;;; location
;               '(left . 0) ; 620
;               '(top . 0)
               )
              default-frame-alist))

;; Clipboard
(setq x-select-enable-primary t)
(setq x-select-enable-clipboard t)


;; Enlarge window horizontally
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<up>") 'enlarge-window)
(global-set-key (kbd "C-<down>") 'shrink-window)

(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail));spaces tabs newline space-mark tab-mark newline-mark face lines-tail))
(setq whitespace-global-modes '(not org-mode web-mode "Web" emacs-lisp-mode))
(global-whitespace-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (auto-complete python-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'xterm-256color)
(require 'term+key-intercept)
(require 'term+mode)
(require 'term+mux)
(eval-after-load 'evil
                 '(progn (require 'term+evil)
                     (when (featurep 'term+mode)(require 'multi-mode+evil))))
(require 'term+anything-shell-history)
(define-key global-map (kbd "C-S-a") 'ansi-term)
(define-key term+char-map (kbd "C-t") 'nil)
(define-key term+char-map (kbd "C-k") 'kill-line)
