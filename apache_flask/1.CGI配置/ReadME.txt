1. 檢查/etc/apache2/mods-available/是否含有
    cgi.load
    cgid.conf
    cgid.load
2. 檢查/etc/apache2/mods-enable/是否含有
    cgi.load  # 此項不重要
    cgid.conf
    cgid.load

若不存在，則使用以下指令
    a2enmod cgi
    a2enmod cgid

3. apache2.conf設定，增加以下內容

<Directory /usr/lib/cgi-bin/>
	Options +ExecCGI
	AllowOverride None
	Require all granted
	AddHandler cgi-script .py .cgi
</Directory>
ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/

4. 習慣上會在設定捷徑，方便使用
ln -s /usr/lib/cgi-bin/ /var/www/cgi-bin/