#!/usr/bin/env ruby
# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "config", "environment"))

anchor_time = Time.now.utc

ModAction.without_timeout do
  ModAction.where("created_at < ?", anchor_time).where(action: "comment_hide").in_batches.update_all(action: "comment_delete")
  ModAction.where("created_at < ?", anchor_time).where(action: "comment_unhide").in_batches.update_all(action: "comment_undelete")
  ModAction.where("created_at < ?", anchor_time).where(action: "comment_delete").in_batches.update_all(action: "comment_destroy")
end
