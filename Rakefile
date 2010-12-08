installable = [:vim, :ack, :irssi, :git, :screen, :bash]
task :install => installable.map { |i| "#{i}:install" }
task :uninstall => installable.map { |i| "#{i}:uninstall" }

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

namespace :bash do
  task :install do
    link('bashrc')
  end
  task :uninstall do
    unlink('bashrc')
  end
end

namespace :ack do
  task :install do
    link('ackrc')
  end
  task :uninstall do
    unlink('ackrc')
  end
end

namespace :irssi do  
  task :install do
    link('irssi')
  end
  task :uninstall do
    unlink('irssi')
  end
end

namespace :screen do
  task :install do
    link('screenrc')
  end
  task :uninstall do
    unlink('screenrc')
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
