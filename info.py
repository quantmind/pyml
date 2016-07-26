from pkg_resources import require


if __name__ == '__main__':
    packages = require('numpy', 'scipy', 'tables', 'psycopg2',
                       'pandas', 'lxml', 'Pillow', 'scikit-learn',
                       'Theano', 'tensorflow')
    n = 0
    for p in packages:
        n = max(n, len(p.key))

    n += 3
    fmt = '{0:<%d}{1}' % n
    processed = set()
    for p in sorted(packages, key=lambda v: v.key):
        if p.key in processed:
            continue
        print(fmt.format(p.key, p.version))
        processed.add(p.key)
