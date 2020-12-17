node {
      for (i=0; i<2; i++) { 
           stage "Stage #" +i
           print 'Hello, world!'
           if (i==0)
           {
               git "https://github.com/CDowni/Coursework2"
               echo 'Running on Stage #0'
           }
           else {
               build 'devops_coursework'
               echo 'Running on Stage #1'
               print 'Test Stage #1'
           }
      }
}
 
