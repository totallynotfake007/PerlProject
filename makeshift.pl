#!/opt/ActivePerl-5.24/bin/perl5.24.0
use Tk;
use Net::FTP;

my $mw = new MainWindow;
my $mb = $mw->Frame(-relief => 'ridge', -bd => 5);
my $m_file = $mb->Menubutton(-text      => "Commands",
                          -underline => 1);
my $m_Credits = $mb->Menubutton(-text      => "Credits",
                          -underline => 1);
my $m_Exit = $mb->Menubutton(-text      => "Exit",
                          -underline => 1);
$mb    ->pack(-side => "top",
                 -fill => "x",
                 );
$m_file->pack(-side => "left");
$m_Credits->pack(-side => "left");
$m_Exit->pack(-side => "left");
$m_file->command(-label   => "ls",
                 -command => [\&ls],
                );
$m_file->command(-label   => "pwd",
                 -command => [\&pwd],
                );
$m_Credits->command(-label   => "Credits",
                 -command => [\&Credits],
                );
$m_Exit->command(-label   => "Exit",
                 -command => [\&exitus],
                );
my $top = $mw->Frame(-background => 'Black')->pack('-side' => 'top');
$top->Photo('logo', -file => "LOGO.gif");
$top->Label('-image' => 'logo')->pack();
$mw->title ("FTP Master");
my $label1 = $mw->Label (-text=>"----====[Login]====----" ,
                 -height=>5,
                 -width=>40,
                 );
my $label666 = $mw->Label (-text=>"\n----===============----\n",
                 -height=>3,
                 -width=>40,
                 );
my $label777 = $mw->Label (-text=>"\n",
                 -height=>1,
                 -width=>40,
                 );
my $label888 = $mw->Label (-text=>"\n",
                 -height=>1,
                 -width=>40,
                 );
my $label3 = $mw->Label (-text=>"UserName:");
my $entry3 = $mw->Entry (-width=>20);
my $label4 = $mw->Label (-text=>"Password:");
my $entry4 = $mw->Entry (-show=>'*', -width=>20);
my $label5 = $mw->Label (-text=>"Host Address:");
my $entry5 = $mw->Entry (-width=>20);
my $button1= $mw->Button(-text=>"[LoGiN]",
                 -background=>"red",
                 -command=>[\&login],
                 );
my $label6 = $mw->Label (-text=>"Upload:");
my $entry6 = $mw->Entry (-width=>20);
my $label7 = $mw->Label (-text=>"Download:");
my $entry7 = $mw->Entry (-width=>20);
my $label8 = $mw->Label (-text=>"Delete File:");
my $entry8 = $mw->Entry (-width=>20);
my $button2= $mw->Button(-text=>"Upload",
                 -height=>2,
                 -width=>11,
                 -command=>[\&upload],
                 );
my $button3= $mw->Button(-text=>"Download",
                 -height=>2,
                 -width=>11,
                 -command=>[\&download],
                 );
my $button4= $mw->Button(-text=>"Delete",
                 -height=>2,
                 -width=>11,
                 -command=>[\&del],
                 );
$label1->pack (-side=>"top",-anchor=>'n');
$label3->pack (-side=>"top",-anchor=>'n');
$entry3->pack (-side=>"top",-anchor=>'n');
$label4->pack (-side=>"top",-anchor=>'n');
$entry4->pack (-side=>"top",-anchor=>'n');
$label5->pack (-side=>"top",-anchor=>'n');
$entry5->pack (-side=>"top",-anchor=>'n');
$label777->pack (-side=>"top",-anchor=>'n');
$button1->pack(-side=>"top",-anchor=>'n');
$label666->pack (-side=>"top",-anchor=>'n');
$label6->pack (-side=>"top",-anchor=>'n');
$entry6->pack (-side=>"top",-anchor=>'n');
$label7->pack (-side=>"top",-anchor=>'n');
$entry7->pack (-side=>"top",-anchor=>'n');
$label7->pack (-side=>"top",-anchor=>'n');
$entry7->pack (-side=>"top",-anchor=>'n');
$label8->pack (-side=>"top",-anchor=>'n');
$entry8->pack (-side=>"top",-anchor=>'n');
$label888->pack (-side=>"top",-anchor=>'n');
$button2->pack(-side=>"left",-anchor=>'s');
$button3->pack(-side=>"right",-anchor=>'s');
$button4->pack(-side=>"bottom",-anchor=>'s');


  sub login {
   my $user = $entry3->get;
   my $pw = $entry4->get;
   my $location = $entry5->get;
   $ftp = Net::FTP->new("$location", Debug => 0) || die $mw->messageBo
+x (-message=>"Down??!");
   $ftp->login("$user","$pw") || die $mw->messageBox (-message=>"User 
+or Passwort not correct!");;
   $ftp->quit;
   $mw->messageBox (-message=>"Login SuccessFul!");
  }  
     sub upload {
   my $upload = $entry6->get;
   my $user = $entry3->get;
   my $pw = $entry4->get;
   my $location = $entry5->get;
   $ftp = Net::FTP->new("$location", Debug => 0) || die $mw->messageBo
+x (-message=>"Down??!");
   $ftp->login("$user","$pw") || die $mw->messageBox (-message=>"Username 
+or Passwort not correct!");
      if ($upload =~ /.txt|.log|.html|.php/)    { 
        $ftp->type(A);
    } else { 
        $ftp->type(I);
    }
   $ftp->put($upload);
   $ftp->quit;
   $mw->messageBox (-message=>"Successfully uploaded!");
   }
     sub download {
   my $download = $entry7->get;
   my $user = $entry3->get;
   my $pw = $entry4->get;
   my $location = $entry5->get;
   $ftp = Net::FTP->new("$location", Debug => 0) || die $mw->messageBo
+x (-message=>"Down??!");
   $ftp->login("$user","$pw") || die $mw->messageBox (-message=>"Username 
+Passwort not correct!");
   if ($downlaod =~ /.txt|.log|.html|.php/)    { 
        $ftp->type(A);
    } else { 
        $ftp->type(I);
    }
   $ftp->get($download) || die $mw->messageBox (-message=>"File Not Found??!");
   $ftp->quit;
   $mw->messageBox (-message=>"!");
   }
     sub ls {
   my $user = $entry3->get;
   my $pw = $entry4->get;
   my $location = $entry5->get;
       $ftp = Net::FTP->new("$location", Debug => 0) || die $mw->messa
+geBox (-message=>"Down??!");
       $ftp->login("$user","$pw") || die $mw->messageBox (-message=>"Username 
+or Passwort not correct!");
       @files = $ftp->ls();
     $mw->messageBox (-message=>"@files");
     $ftp->quit;
}
     sub pwd {
   my $user = $entry3->get;
   my $pw = $entry4->get;
   my $location = $entry5->get;
       $ftp = Net::FTP->new("$location", Debug => 0) || die $mw->messa
+geBox (-message=>"Down??!");
       $ftp->login("$user","$pw") || die $mw->messageBox (-message=>"Username 
+or Passwort not correct!");
     $show=$ftp->pwd();
     $mw->messageBox (-message=>"Aktuelles Verzeichnis des FTP-Servers
+: $show");
     $ftp->quit;
}
     sub del {
   my $user = $entry3->get;
   my $pw = $entry4->get;
   my $location = $entry5->get;
   my $dele = $entry8->get;
   chomp($dele);
       $ftp = Net::FTP->new("$location", Debug => 0) || die $mw->messa
+geBox (-message=>"Down??!");
       $ftp->login("$user","$pw") || die $mw->messageBox (-message=>"U
+ser oder Passwort falsch!");
       $ftp->delete($dele) || die $mw->messageBox (-message=>"Konnte n
+icht gelöscht werden!");
       $ftp->quit;
       $mw->messageBox (-message=>"Datei gelöscht!");
}
     sub Credits {
     $mw->messageBox (-message=>"----===============----\n\nFTP Master
+\nby\nPerforin\n\nWatch these sites!\n\nwww.perforins-software.dl.am\
+n\nwww.dark-codez.org\n\nJoin the dark side of coding!\n");
}
     sub exitus {
     exit();
}
MainLoop;

