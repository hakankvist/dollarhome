;;; Emacs Load Path
;;; (setq load-path (cons "~/emacs" load-path))
(setq load-path (cons "~/.emacs.d/show-wspace" load-path))

;; Enable bells and whistles
(cond ((fboundp 'global-font-lock-mode)
            ;; Turn on font-lock in all modes that support it
            (global-font-lock-mode t)
            ;; Maximum colors
            (setq font-lock-maximum-decoration t)))

;; Don't remember what this is, probably something with 8bit chars
;; on really old unix computers
(set-input-mode (car (current-input-mode))
                (nth 1 (current-input-mode))
                0)

;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;;to set the cursor color
(set-cursor-color "blue")

;;highlight bad whitespaces
(require 'show-wspace)
     (add-hook 'font-lock-mode-hook 'show-ws-highlight-tabs)
     (add-hook 'font-lock-mode-hook 'show-ws-highlight-hard-spaces)
     (add-hook 'font-lock-mode-hook 'show-ws-highlight-trailing-whitespace)

;;enable upcase region, without stupid questions
(put 'upcase-region 'disabled nil)

;(setq load-path (cons "~/lib/emacs" load-path))
;     (setq auto-mode-alist
;           (append auto-mode-alist
;                   '(("\\.[hg]s$"  . haskell-mode)
;                    ("\\.hi$"     . haskell-mode)
;                     ("\\.l[hg]s$" . literate-haskell-mode))))
;     (autoload 'haskell-mode "haskell-mode"
;        "Major mode for editing Haskell scripts." t)
;     (autoload 'literate-haskell-mode "haskell-mode"
;        "Major mode for editing literate Haskell scripts." t)

;(add-hook 'haskell-mode-hook 'turn-on-haskell-font-lock)
;     (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
;     (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;     (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;     (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;     (add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)

;;remap to be sane...
(keyboard-translate ?\C-h ?\C-?)

;; Do not add a newline upon extra down button
(setq next-line-add-newlines nil)

;; Enables the erase buffer command
(put 'erase-buffer 'disabled nil)

;; colum number mode
(column-number-mode 1)

;; set yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; set printer properties
(setq ps-paper-type 'a4)
(setq ps-print-color-p nil)

;; show the parantheses
(setq show-paren-mode t)

;; Matching parantheses
(show-paren-mode 1)

;; Do not use tabs, only spaces in all modes
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; indent width
(setq-default tab-width 4);

;; disable tool bar
(menu-bar-mode nil)
(tool-bar-mode nil)

;; Default C style
(setq c-default-style "bsd"
      c-basic-offset 4)

;; Disable the splash screen
(setq inhibit-splash-screen t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Put backupfiles on the c-drive, don't fill dynamic vobs with;
;; backup files
;;

;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
 (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;;
;; End of backup-thingies
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
