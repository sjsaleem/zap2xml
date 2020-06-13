# sjtv-zap2xml
Docker container for zap2xml. DockerFile to build from Alpine for a small, portable zap2xml instance. Removes dependency questions.


# zap2xml Options

      -u <username>
      -p <password>
      -d <# of days> (default = $days)
      -n <# of no-cache days> (from end)   (default = $ncdays)
      -N <# of no-cache days> (from start) (default = $ncsdays)
      -B <no-cache day>
      -s <start day offset> (default = $start)
      -o <output xml filename> (default = "$outFile")
      -c <cacheDirectory> (default = "$cacheDir")
      -l <lang> (default = "$lang")
      -i <iconDirectory> (default = don't download channel icons)
      -m <#> = offset program times by # minutes (better to use TZ env var)
      -b = retain website channel order
      -x = output XTVD xml file format (default = XMLTV)
      -w = wait on exit (require keypress before exiting)
      -q = quiet (no status output)
      -r <# of connection retries before failure> (default = $retries, max 20)
      -e = hex encode entities (html special characters like accents)
      -E "amp apos quot lt gt" = selectively encode standard XML entities
      -F = output channel names first (rather than "number name")
      -O = use old tv_grab_na style channel ids (C###nnnn.zap2it.com)
      -A "new live" = append " *" to program titles that are "new" and/or "live"
      -M = copy movie_year to empty movie sub-title tags
      -U = UTF-8 encoding (default = "ISO-8859-1")
      -L = output "<live />" tag (not part of xmltv.dtd)
      -T = don't cache files containing programs with "$sTBA" titles 
      -P <http://proxyhost:port> = to use an http proxy
      -C <configuration file> (default = "$confFile")
      -S <#seconds> = sleep between requests to prevent flooding of server 
      -D = include details = 1 extra http request per program!
      -I = include icons (image URLs) - 1 extra http request per program!
      -J <xmltv> = include xmltv file in output
      -Y <lineupId> (if not using username/password)
      -Z <zipcode> (if not using username/password)
      -z = use tvguide.com instead of zap2it.com
      -a = output all channels (not just favorites) 
      -j = add "series" category to all non-movie programs

# Environment Settings
You can configure the following environment variables in Dockerfile as below:
# Required
- USERNAME - zap2it.com or tvguide.com username
- PASSWORD - zap2it.com or tvguide.com password
# Optional
- OPT_ARGS - additional command line arguments for zap2xml. Add -z for tvguide.com
- XMLTV_FILENAME - filename for your xmltv file (default: xmltv.xml)
- SLEEPTIME - time in seconds to wait before next run (default: 43200)

# zap2xml additional arguments
You can configure additional parameters to zapxml.pl command in entry.sh file. Look Options above

# Build process (manual)
Clone this repository
Open the cloned directory and run below command
docker build -t zap2xml .

Requires:
/data volume, This volume is used for cache, config, and output

# Example run command 
docker run --rm -v /data/docker/zap2xml:/data zap2xml 

This will output xmltv.xml file with a week EPG data in /data/docker/zapxml/ folder


Notes: This repo is derived from the work of [shuaiscott] (https://github.com/shuaiscott/zap2xml) and [crlorentzen] (https://github.com/crlorentzen/docker-zap2xml)
