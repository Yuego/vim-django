" django.vim - A bangin' interface for ViM and Django
" Maintainer: Colin Wood <cwood06@gmail.com>
" Version: 0.3.1a
" License: Same as ViM. see http://www.gnu.org/licenses/vim-license.txt


if !has('python')
    echoerr "This script wont work without Python. Please compile with it."
    finish
endif

if !exists('g:django_projects')
    " Where the projects are stored at. Will start from this
    " root and search down for all someapp.settings files
    let g:django_projects = expand('~/Projects')
endif

if !isdirectory(g:django_projects)
    echoerr "Could not access ".g:django_projects
    finish
endif

if !exists('g:django_project_templates')
    let g:django_project_templates = expand('~/.templates/projects')
endif

if !exists('g:django_app_templates')
    let g:django_app_templates = expand('~/.templates/apps')
endif

command! -nargs=? -complete=customlist,django#completions#managmentcommands DjangoManage call django#commands#manage(<q-args>)
command! -nargs=1 -complete=customlist,django#completions#projectscomplete DjangoProjectActivate call django#project#activate(<q-args>)
command! -nargs=? -complete=customlist,django#completions#managmentcommands DjangoAdmin call django#commands#admin(<q-args>)
command! -nargs=? -complete=customlist,django#completions#pypath DjangoCreateApp call django#apps#create_app(<q-args>)
