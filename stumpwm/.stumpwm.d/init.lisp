;; -*-lisp-*-
;; StumpWM - init.lisp
;; Cody Reichert <codyreichert@gmail.com>

(in-package :stumpwm)

(add-to-load-path "~/.stumpwm.d/contrib/")

(add-to-load-path "/home/cody/.emacs.d/elpa/slime-20150627.1630/swank")
(load "/home/cody/.emacs.d/elpa/slime-20150627.1630/swank-loader.lisp")

(add-to-load-path "/home/cody/.stumpwm.d/contrib/modeline/cpu")
(add-to-load-path "/home/cody/.stumpwm.d/contrib/modeline/mem")
(add-to-load-path "/home/cody/.stumpwm.d/contrib/minor-mode/mpd")

(load-module "cpu")
(load-module "mem")
(load-module "mpd")

(setf stumpwm:*ignore-wm-inc-hints* t) ; fixes space around some windows

;; keys
(set-prefix-key (kbd "C-t"))

(define-key *root-map* (kbd "C-s") "swank")       
(define-key *root-map* (kbd "c") "exec terminator")
(define-key *root-map* (kbd "C-c") "exec chromium")
(define-key *root-map* (kbd "m") "toggle-current-mode-line")

(define-key *root-map* (kbd "C-m") 'mpd:*mpd-map*)
(define-key mpd:*mpd-map* (kbd "C-g") "smirk-shuffle-genre")
(define-key mpd:*mpd-map* (kbd "C-a") "smirk-shuffle-artist")
(define-key mpd:*mpd-map* (kbd "C-t") "smirk-shuffle-tracks")


(defcommand smirk-shuffle-artist (artist) ((:string "Arist: "))
  "Shuffle MPD with the given artist."
  (stumpwm:run-shell-command (concat "smirk artist " artist)))

(defcommand smirk-shuffle-genre (genre) ((:string "Genre: "))
    "Shuffle MPD with the given genre."
  (stumpwm:run-shell-command (concat "smirk genre " genre)))

(defcommand smirk-shuffle-tracks () ()
    "Play a random 250 tracks in MPD."
  (stumpwm:run-shell-command "smirk tracks"))


;; swank
(swank-loader:init)

(defvar *swank-p* nil)

(defcommand swank () ()
"Starts a swank server on port 4005 and notifies the user."
  (setf stumpwm:*top-level-error-action* :break)
  (if *swank-p*
      (message "Swank server already running.")
    (progn
      (swank:create-server :port 4005
			   :style swank:*communication-style*
			   :dont-close t)
      (setf *swank-p* t)
      (message "Starting swank on port 4005."))))



;; MPD
(mpd:mpd-connect)


(setf mpd:*mpd-modeline-fmt* "%a - %t (%n/%p)")


;; mode-line
(defcommand toggle-current-mode-line () ()
  "Toggle the current screens mode-line."
  (stumpwm:toggle-mode-line (stumpwm:current-screen)
                            (stumpwm:current-head)))

(defun enable-mode-line-all-heads ()
  (dolist (screen *screen-list*)
    (dolist (head (screen-heads screen))
      (enable-mode-line screen head t))))

(setf stumpwm:*screen-mode-line-format*
      (list
       "[^B%n^b] %W "
       "^> %m | %M | %c | "
       '(:eval (run-shell-command "date '+%F %a %R' | tr -d [:cntrl:]" t))))

(setf *mode-line-timeout* 2)

(enable-mode-line-all-heads)
