# README

Cálculo de Alunos

Esta ferramenta calcula dados de aluno conforme selecionado (Cálculo de CR ou Cálculo de Carga Horária), num formato csv, dado um csv no seguinte formato:

matricula,nota,ch\
123456,090,50\
85145615,100,68\
454514515,100,30\
123456,087,60

Como rodar:

 Além dos procedimentos padrão, é necessário rodar o bundle exec sidekiq, pois por algum erro de configuração ele não está rodando ao iniciar o servidor.
 
 
Regras Cumpridas:

        O cálculo do CR é a média ponderada com a carga horária. Todos as tuplas do aluno devem ser consideradas e todas são de aprovação.

        O cálculo de CH é a soma da carga horária de todas as cargas horárias de todas as tuplas do aluno.

        Ao término do processamento o csv enviado deve ser removido e persistido o novo csv com resultado;
        
        Deve ser possível executar mais de um processamento ao mesmo tempo;

        Deve ser possível baixar o arquivo de resultado após o término através de um botão de download;


Recomendações Cumpridas

        Você pode utilizar um framework de BackgroundJob com fila. (ActiveJob, Sidekiq, Resque...)

        Você pode utilizar o pattern strategy ou outros padrões que julgar necessário

        Você pode utilizar o ActiveStorage
        
Regras Pendentes:
        
        Após solicitado o processamento (enfileirado ou iniciado), deve ser possível cancelá-lo.
        
        Durante o processamento, o usuário deve poder acompanhar o progresso de cada processamento individualmente.
        
        Você pode utilizar o ActionCable
