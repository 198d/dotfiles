task :install => ["vim:install", "git:install"]
task :uninstall => ["vim:uninstall", "git:uninstall"]

namespace :vim do
  task :install do
    link('vimrc')
    link('vim')
  end
  task :uninstall do
    unlink('vimrc')
    unlink('vim')
  end
end

namespace :git do
  task :install do
    link('gitignore')
    `git config --global core.excludesfile ~/.gitignore`
  end
  task :uninstall do
    unlink('gitignore')
  end
end

def base
  File.expand_path(File.dirname(__FILE__))
end

def link(file)
  `ln -Fhs #{base}/#{file} ~/.#{file}`
end

def unlink(file)
  `rm -f ~/.#{file}`
end
