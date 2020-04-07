# gsheet 0.4.5

- Pull request from adaRn to enable more customisation of parsing

# gsheet 0.4.3

- Added a link to google sheets to description

# gsheet 0.4.2

- fixes to make tests agnostic to use of readr vs base

# gsheet 0.4.0

- gsheet2tbl now uses readr if it is available
- new function construct_download_url allows manual downloading using readr

# gsheet 0.3.0

## Minor changes

- Moved from rvest and xml2 to purely using httr.

## Bugfixes

- Changed URL format to match a change made by Google. Resolved #6 and #7

# gsheet 0.2.1

## Bugfixes

- Fixed issue due to deprecated function in rvest

# gsheet 0.1.1.9000

## Major

- Users can now download from arbitrary sheets, rather than just the first.

## Minor

- Now fails with an informative error when 'share by link' is turned off.

## Bugfixes

- Fixed namespace bugs (#1)
- Fixed further namespace bugs resulting from new stringr version

# gsheet 0.1

- First release
