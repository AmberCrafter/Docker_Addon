1. 確認套件是否安裝
    flask
2. 配置橋接文件，須放置於cgi-bin目錄下
### </cgi-bin/myapp.cgi>
    from wsgiref import CGIHandler
    from myapp import app

    CGIHandler().run(app)
3. 建置web application
### </cgi-bin/myapp.py>
    from flask import Flask
    app=Flask(__name__)
    @app.route('/')
    def index():
        return {information}
4. 進階配置，搭配html模板
### </cgi-bin/myapp.py>
    #!/usr/bin/python3
    # -*- coding: UTF-8 -*-

    from flask import Flask, render_template

    import plotly
    import plotly.graph_objs as go

    import pandas as pd
    import numpy as np
    import json

    def create_plot():
        N = 40
        x = np.linspace(0, 1, N)
        y = np.random.randn(N)
        df = pd.DataFrame({'x': x, 'y': y}) # creating a sample dataframe
        data = [
            go.Bar(
                x=df['x'], # assign x as the dataframe column 'x'
                y=df['y']
            )
        ]

        graphJSON = json.dumps(data, cls=plotly.utils.PlotlyJSONEncoder)
        return graphJSON

    app = Flask(__name__)
    @app.route('/')
    def index():
        bar = create_plot()
        return render_template('testdash.html', plot=bar)

    if __name__ == '__main__':
        app.run()


### </cgi-bin/template/template.html>
    <!DOCTYPE html>
    <html>
    <head lang="en">
        <meta charset="UTF-8">
        <title>My First Dashboard</title>
        <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.6/d3.min.js"></script>
    </head>
    <body>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="chart" id="bargraph">
                    <script>
                        var graphs = {{plot | safe}};
                        Plotly.plot('bargraph',graphs,{});
                    </script>
                </div>
            </div>
        </div>
    </div>
    </body>
    </html>