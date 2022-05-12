if config.framework_env == 'staging'
  run "cd #{config.release_path} && jekyll build --destination 'public' --future --drafts"
else
  run "cd #{config.release_path} && jekyll build --destination 'public'"
end
