;; gnus config for qq mail 
(setq user-mail-address "gcc_linux@foxmail.com"
      user-full-name "gcc_linux@foxmail.com")

(setq gnus-select-method
      '(nnimap "qqmail"
	       (nnimap-address "imap.qq.com")
	       (nnimap-server-port "993")
	       (nnimap-stream ssl)))

(setq smtpmail-smtp-server "smtp.qq.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
