;;; helm-open-junk-file.el --- open-junk-file with helm interface -*- lexical-binding: t; -*-

;; Copyright (C) 2017 by Seiki Koga

;; Author: Seiki Koga <alfr0475@gmail.com>
;; URL: https://github.com/Alfr0475/helm-open-junk-file
;; Version: 1.0.0
;; Package-Requires: ((helm "2.5.4"))

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
;; helm-open-junk-file.el provides a helm interface to "open-junk-file".

;;; Code:

(require 'em-glob)
(require 'helm)
(require 'helm-mode)
(require 'helm-files)
(require 'open-junk-file)

(defgroup helm-open-junk-file nil
  "open-junk-file with helm interface"
  :prefix "helm-open-junk-file-"
  :group 'helm)

(defcustom helm-open-junk-file-directory
  "~/junk/"
  "*open junk file default directory"
  :type 'string
  :group 'helm-open-junk-file)


(defvar helm-source-open-junk-file
      '((name . "Junk Files")
        (candidates . (lambda()
                        (reverse (eshell-extended-glob
                                  (concat (file-name-as-directory helm-open-junk-file-directory) "*")))))))

;;;###autoload
(defun helm-open-junk-file ()
  (interactive)
  (helm :sources 'helm-source-open-junk-file
        :buffer "*helm for junk files*"))

(provide 'helm-open-junk-file)

;;; helm-open-junk-file.el ends here
