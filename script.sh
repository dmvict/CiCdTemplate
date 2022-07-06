          files_master=$(curl -X GET -G \
            -H "Accept: application/vnd.github+json" \
            -H "Authorization: token "$GITHUB_TOKEN \
            https://api.github.com/repos/Wandalen/CiCdTemplate/contents/.github/workflows \
            -d 'ref=master')
          files_alpha=$(curl -X GET -G \
            -H "Accept: application/vnd.github+json" \
            -H "Authorization: token "$GITHUB_TOKEN \
            https://api.github.com/repos/Wandalen/CiCdTemplate/contents/.github/workflows \
            -d 'ref=alpha')

          if [[ "$files_master" == "$files_alpha" ]] ; then
            echo "::set-output name=not_equal::false"
          else
            echo "::set-output name=not_equal::true"
          fi

