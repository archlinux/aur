<?php
/* -*- tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- */
/*
# ***** BEGIN LICENSE BLOCK *****
# This file is part of Plume Framework, a simple PHP Application Framework.
# Copyright (C) 2001-2007 Loic d'Anterroches and contributors.
#
# Plume Framework is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2.1 of the License, or
# (at your option) any later version.
#
# Plume Framework is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
# ***** END LICENSE BLOCK ***** */

/**
 * This file contains the define of the [P]luf [App]lication for the
 * automatic admin generation.
 */
return array(
  'path' => 'idf',
  'name' => __('Indefero'),
  'models' => array(
      'commit' => array('model' => 'IDF_Commit'),
      'conf' => array('model' => 'IDF_Conf'),
      'issue' => array('model' => 'IDF_Issue'),
      'issue_comment' => array('model' => 'IDF_IssueComment'),
      'issue_file' => array('model' => 'IDF_IssueFile'),
      'key' => array('model' => 'IDF_Key'),
      'project' => array('model' => 'IDF_Project'),
      'review' => array('model' => 'IDF_Review'),
      'review_comment' => array('model' => 'IDF_Review_Comment'),
      'review_file_comment' => array('model' => 'IDF_Review_FileComment'),
      'review_patch' => array('model' => 'IDF_Review_Patch'),
      'scm_cache_git' => array('model' => 'IDF_Scm_Cache_Git'),
      'search_occ' => array('model' => 'IDF_Search_Occ'),
      'tag' => array('model' => 'IDF_Tag'),
      'upload' => array('model' => 'IDF_Upload'),
      'wiki_page' => array('model' => 'IDF_WikiPage'),
      'wiki_revision' => array('model' => 'IDF_WikiRevision'),
      'message' => array('model' => 'Pluf_Message'),
      'permission' => array('model' => 'Pluf_Permission'),
      'row_permission' => array('model' => 'Pluf_RowPermission'),
      'search_occ' => array('model' => 'Pluf_Search_Occ'),
      'search_word' => array('model' => 'Pluf_Search_Word')
      'timeline' => array('model' => 'IDF_Timeline')
    )
);
