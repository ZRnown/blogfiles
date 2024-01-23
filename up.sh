system_time=$(date)
hexo g && hexo d && git add . && git commit -m "$system_time" && git push
